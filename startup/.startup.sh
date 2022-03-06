#!/bin/zsh

# Remap Caps Lock to escape.
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x700000039,
      "HIDKeyboardModifierMappingDst":0x700000029}]
}'
