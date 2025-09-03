import { useRouter } from "expo-router";
import React, { useState } from "react";
import {
  Alert,
  Modal,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";
import { submitTrafficReport } from "../../utils/api";

import { SafeAreaView } from "react-native-safe-area-context";

export default function HomeScreen() {
  const [location, setLocation] = useState("");
  const [severity, setSeverity] = useState<"low" | "medium" | "high">("medium");
  const [notes, setNotes] = useState("");
  const [modalVisible, setModalVisible] = useState(false);
  const router = useRouter();

  const handleSubmit = async () => {
    if (!location.trim()) {
      Alert.alert("Error", "Location is required");
      return;
    }
    try {
      await submitTrafficReport(location, severity, notes);
      Alert.alert("Report Sent", "Your traffic report has been submitted.");
      setLocation("");
      setNotes("");
      setSeverity("medium");
    } catch (err) {
      Alert.alert("Error", "Failed to send report");
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.content}>
        <Text style={styles.title}>Report Traffic Condition</Text>

        <TextInput
          placeholder="Location (e.g., Downtown, Highway 5)"
          value={location}
          onChangeText={setLocation}
          style={styles.input}
          placeholderTextColor="#9CA3AF"
        />

        <Text style={styles.label}>Severity</Text>
        <TouchableOpacity
          style={styles.dropdownButton}
          onPress={() => setModalVisible(true)}
        >
          <Text style={styles.dropdownText}>
            {severity.charAt(0).toUpperCase() + severity.slice(1)}
          </Text>
        </TouchableOpacity>

        {/* Modal for dropdown */}
        <Modal
          visible={modalVisible}
          transparent
          animationType="fade"
          onRequestClose={() => setModalVisible(false)}
        >
          <TouchableOpacity
            style={styles.modalOverlay}
            activeOpacity={1}
            onPress={() => setModalVisible(false)}
          >
            <View style={styles.modalContainer}>
              {["low", "medium", "high"].map((level) => (
                <TouchableOpacity
                  key={level}
                  style={[
                    styles.optionItem,
                    severity === level && styles.selectedOption,
                  ]}
                  onPress={() => {
                    setSeverity(level as "low" | "medium" | "high");
                    setModalVisible(false);
                  }}
                >
                  <Text
                    style={[
                      styles.optionText,
                      severity === level && styles.selectedText,
                    ]}
                  >
                    {level.charAt(0).toUpperCase() + level.slice(1)}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
          </TouchableOpacity>
        </Modal>

        <TextInput
          placeholder="Additional Notes"
          value={notes}
          onChangeText={setNotes}
          multiline
          numberOfLines={4}
          style={[styles.input, { height: 100, textAlignVertical: "top" }]}
          placeholderTextColor="#9CA3AF"
        />

        <TouchableOpacity style={styles.submitButton} onPress={handleSubmit}>
          <Text style={styles.submitText}>Submit Report</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0B1B3D", // Match your theme
  },
  content: {
    flex: 1,
    padding: 20,
    // paddingTop: 30, // Optional: extra top padding
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    color: "#FFFFFF",
    marginBottom: 20,
  },
  label: {
    color: "#D1D5DB",
    marginBottom: 6,
    fontSize: 16,
  },
  input: {
    backgroundColor: "#1E3A8A",
    color: "#FFFFFF",
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderRadius: 8,
    marginBottom: 15,
    fontSize: 16,
  },
  dropdownButton: {
    backgroundColor: "#1E3A8A",
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderRadius: 8,
    marginBottom: 15,
    justifyContent: "center",
  },
  dropdownText: {
    color: "#FFFFFF",
    fontSize: 16,
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: "rgba(0, 0, 0, 0.5)",
    justifyContent: "center",
    alignItems: "center",
  },
  modalContainer: {
    width: 250,
    backgroundColor: "#1E3A8A",
    borderRadius: 10,
    overflow: "hidden",
  },
  optionItem: {
    paddingVertical: 15,
    paddingHorizontal: 20,
  },
  selectedOption: {
    backgroundColor: "#007BFF",
  },
  optionText: {
    color: "#FFFFFF",
    fontSize: 16,
    textAlign: "center",
  },
  selectedText: {
    fontWeight: "bold",
  },
  submitButton: {
    backgroundColor: "#10B981",
    paddingVertical: 15,
    borderRadius: 8,
    alignItems: "center",
    marginTop: 10,
  },
  submitText: {
    color: "#FFFFFF",
    fontSize: 18,
    fontWeight: "600",
  },
});
