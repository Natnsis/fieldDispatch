import { SplashScreen, Stack } from "expo-router";
import { useFonts } from "expo-font";
import { useEffect } from "react";

import { Inter_400Regular } from "@expo-google-fonts/inter";

SplashScreen.preventAutoHideAsync();

const initialFonts = {
  inter: Inter_400Regular,
};

export default function RootLayout() {
  const [fontsLoaded, fontError] = useFonts(initialFonts);
  useEffect(() => {
    if (fontsLoaded || fontError) {
      SplashScreen.hideAsync();
    }
  }, [fontsLoaded, fontError]);

  return <Stack screenOptions={{ headerShown: false }} />;
}
