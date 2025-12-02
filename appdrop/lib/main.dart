import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the "Debug" banner
      title: 'Dynamic UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(
        pageJson: {
          "page": {
            "components": [
              {
                "type": "text",
                "value": "Welcome to AppDrop",
                "size": 22,
                "weight": "bold",
                "align": "center",
                "padding": 16
              },
              {
                "type": "banner",
                "image":
                    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
                "height": 180,
                "padding": 16,
                "radius": 14
              },
              {
                "type": "carousel",
                "images": [
                  "https://images.unsplash.com/photo-1518770660439-4636190af475",
                  "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
                  "https://images.unsplash.com/photo-1519389950473-47ba0277781c"
                ],
                "height": 220,
                "autoPlay": true,
                "padding": 12
              },
              {
                "type": "grid",
                "images": [
                  "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
                  "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
                  "https://images.unsplash.com/photo-1483985988355-763728e1935b",
                  "https://images.unsplash.com/photo-1491557345352-5929e343eb89"
                ],
                "columns": 2,
                "spacing": 10,
                "padding": 16
              },
              {
                "type": "video",
                "url":
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                "autoPlay": false,
                "loop": false,
                "height": 220,
                "padding": 16
              }
            ]
          }
        },
      ),
    );
  }
}
