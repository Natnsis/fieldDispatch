import { useRouter } from "expo-router";
import * as SecureStore from "expo-secure-store";
import React from "react";
import { Alert, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function ProfileScreen() {
  const router = useRouter();

  const handleLogout = async () => {
    await SecureStore.deleteItemAsync("authToken");
    Alert.alert("Logged Out", "See you next time!");
    router.replace("/");
  };

  return (
    <SafeAreaView style={styles.container}>
      {/* Inner content with top padding */}
      <View style={styles.content}>
        <Text style={styles.title}>Dispatcher Profile</Text>

        <View style={styles.infoCard}>
          <Text style={styles.infoLabel}>Name</Text>
          <Text style={styles.infoText}>John Dispatcher</Text>

          <Text style={styles.infoLabel}>Role</Text>
          <Text style={styles.infoText}>Traffic Dispatcher</Text>

          <Text style={styles.infoLabel}>Station</Text>
          <Text style={styles.infoText}>Central Zone 5</Text>
        </View>

        <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
          <Text style={styles.logoutText}>Logout</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0B1B3D", // Full background
  },
  content: {
    flex: 1,
    padding: 20,
    paddingTop: 40, // ✅ This pushes content down from the top
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    color: "#FFFFFF",
    marginBottom: 20,
  },
  infoCard: {
    backgroundColor: "#1E3A8A",
    padding: 16,
    borderRadius: 8,
    marginBottom: 30,
  },
  infoLabel: {
    color: "#9CA3AF",
    fontSize: 14,
    marginTop: 10,
  },
  infoText: {
    color: "#FFFFFF",
    fontSize: 16,
    fontWeight: "500",
  },
  logoutButton: {
    backgroundColor: "#EF4444",
    paddingVertical: 15,
    borderRadius: 8,
    alignItems: "center",
  },
  logoutText: {
    color: "#FFFFFF",
    fontSize: 18,
    fontWeight: "600",
  },
});
