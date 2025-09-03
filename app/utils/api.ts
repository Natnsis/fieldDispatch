// app/utils/api.ts
import * as SecureStore from "expo-secure-store";

// Mock login (replace with real API)
export const loginDispatcher = async (
  username: string,
  password: string
): Promise<{ success: boolean; token?: string; error?: string }> => {
  await new Promise((r) => setTimeout(r, 1000));
  if (username === "dispatcher" && password === "pass123") {
    const token = "fake-jwt-token-123";
    await SecureStore.setItemAsync("authToken", token);
    return { success: true, token };
  }
  return { success: false, error: "Invalid credentials" };
};

// Save report (example)
export const submitTrafficReport = async (
  location: string,
  severity: "low" | "medium" | "high",
  notes: string
) => {
  const token = await SecureStore.getItemAsync("authToken");
  // Replace with fetch or axios
  console.log("Sending report:", { location, severity, notes, token });
  // await fetch('/api/reports', { method: 'POST', body: JSON.stringify(...) })
  return { success: true };
};
