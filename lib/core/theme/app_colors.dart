import 'package:flutter/material.dart';

class AppColors {
  // Primary Luxury Palette (Dark)
  static const Color black = Color(0xFF000000);
  static const Color charcoal = Color(0xFF121212);
  static const Color deepCharcoal = Color(0xFF1A1A1A);
  
  // Primary Luxury Palette (Light)
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFE9ECEF);
  
  // Gold Accents
  static const Color gold = Color(0xFFFFD700);
  static const Color softGold = Color(0xFFFFDF00);
  static const Color darkGold = Color(0xFFB8860B);
  
  // Text Colors
  static const Color grey = Color(0xFFB0B0B0);
  static const Color darkGrey = Color(0xFF404040);
  static const Color textDark = Color(0xFF212529);
  
  // UI Elements
  static const Color glassBackgroundDark = Color(0x1AFFFFFF);
  static const Color glassBackgroundLight = Color(0x1A000000);
  static const Color glassBorderDark = Color(0x33FFFFFF);
  static const Color glassBorderLight = Color(0x33000000);
  
  // Gradients
  static const LinearGradient goldGradient = LinearGradient(
    colors: [gold, darkGold],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [charcoal, black],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightGradient = LinearGradient(
    colors: [white, offWhite],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
