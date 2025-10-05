import { Text, View, ImageBackground } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function Index() {
  return (
    <SafeAreaView className="bg-background-light h-screen">
      <View className="relative w-full">
        <ImageBackground
          source={require("../assets/image/home.png")}
          className="w-full h-[40%]"
          resizeMode="cover"
        >
          <View>
            <Text className="text-white">Dispatcher App</Text>
            <Text>connect</Text>
          </View>
        </ImageBackground>
      </View>
      <View className="">
        <Text className="font-roboto text-2xl text-center">Track, assign,</Text>
        <Text>and manage deliveries</Text>
        <Text>in real-time.</Text>
      </View>
    </SafeAreaView>
  );
}
