#!/bin/bash

# pip install opentype-feature-freezer

pyftfeatfreeze -r MonoLisa-Regular.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss04,ss06,frac,calt,liga MonoLisa-Regular.otf MonaLisa-RegularLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss04,ss06,frac,calt,liga MonoLisa-RegularBold.otf MonaLisa-RegularBoldLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss04,ss06,frac,calt,liga MonoLisa-Bold.otf MonaLisa-BoldLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss04,ss06,frac,calt,liga MonoLisa-Medium.otf MonaLisa-MediumLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss04,ss06,frac,calt,liga MonoLisa-Light.otf MonaLisa-LightLocked.otf

pyftfeatfreeze -r MonoLisa-RegularItalic.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss01,ss02,ss06,frac MonoLisa-RegularItalic.otf MonaLisa-RegularItalicLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss01,ss02,ss06,frac,calt,liga MonoLisa-RegularItalic.otf MonaLisa-RegularItalicLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss01,ss02,ss06,frac,calt,liga MonoLisa-BoldItalic.otf MonaLisa-BoldItalicLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss01,ss02,ss06,frac,calt,liga MonoLisa-MediumItalic.otf MonaLisa-MediumItalicLocked.otf
pyftfeatfreeze --suffix --usesuffix Locked -f zero,ss01,ss02,ss06,frac,calt,liga MonoLisa-LightItalic.otf MonaLisa-LightItalicLocked.otf
