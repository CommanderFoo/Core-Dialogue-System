Assets {
  Id: 7370136930858803589
  Name: "Dialogue_Conversation"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:id"
        Int: 1
      }
      Overrides {
        Name: "cs:name"
        String: ""
      }
      Overrides {
        Name: "cs:dialogue_trigger"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:repeat_dialogue"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_player_look"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_player_movement"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_player_mount"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_player_crouch"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_player_jump"
        Bool: true
      }
      Overrides {
        Name: "cs:enable_ui_interact"
        Bool: true
      }
      Overrides {
        Name: "cs:enable_ui_cursor"
        Bool: true
      }
      Overrides {
        Name: "cs:disable_abilities"
        Bool: true
      }
      Overrides {
        Name: "cs:hide_reticle"
        Bool: true
      }
      Overrides {
        Name: "cs:call_event"
        String: ""
      }
      Overrides {
        Name: "cs:show_indicator"
        Bool: true
      }
      Overrides {
        Name: "cs:indicator_offset"
        Vector {
          Z: 60
        }
      }
      Overrides {
        Name: "cs:indicator_template"
        AssetReference {
          Id: 17143556082452021745
        }
      }
      Overrides {
        Name: "cs:random"
        Bool: false
      }
      Overrides {
        Name: "cs:animation_stance"
        String: ""
      }
      Overrides {
        Name: "cs:animation_stance_playback_rate"
        Float: 1
      }
      Overrides {
        Name: "cs:animation_stance_loop"
        Bool: true
      }
      Overrides {
        Name: "cs:animation"
        String: ""
      }
      Overrides {
        Name: "cs:animation_loop"
        Bool: false
      }
      Overrides {
        Name: "cs:animation_playback_rate"
        Float: 1
      }
      Overrides {
        Name: "cs:id:tooltip"
        String: "The ID for this conversation.  This must be unique."
      }
      Overrides {
        Name: "cs:name:tooltip"
        String: "The name of the character.  This will show up in the speaker element."
      }
      Overrides {
        Name: "cs:dialogue_trigger:tooltip"
        String: "The dialogue trigger for this character.  It\'s important that the dialogue trigger is a child of the character.  See docs."
      }
      Overrides {
        Name: "cs:repeat_dialogue:tooltip"
        String: "Turn off if you do not want the character to repeat their dialogue."
      }
      Overrides {
        Name: "cs:disable_player_look:tooltip"
        String: "Disables the player look when the dialogue is active."
      }
      Overrides {
        Name: "cs:disable_player_movement:tooltip"
        String: "Disables the player movement when the dialogue is active."
      }
      Overrides {
        Name: "cs:disable_player_mount:tooltip"
        String: "Disables the player mount while the dialogue is active."
      }
      Overrides {
        Name: "cs:disable_player_crouch:tooltip"
        String: "Disables the player crouch while the dialogue is active."
      }
      Overrides {
        Name: "cs:disable_player_jump:tooltip"
        String: "Disables the player jump while the dialogue is active."
      }
      Overrides {
        Name: "cs:enable_ui_interact:tooltip"
        String: "If enabled, the player can interact with UI elements."
      }
      Overrides {
        Name: "cs:enable_ui_cursor:tooltip"
        String: "If enabled, the player will be able to see and use their cursor."
      }
      Overrides {
        Name: "cs:hide_reticle:tooltip"
        String: "If enabled, then the reticle will be hidden while the dialogue is active."
      }
      Overrides {
        Name: "cs:call_event:tooltip"
        String: "The event to call when this conversation becomes active."
      }
      Overrides {
        Name: "cs:show_indicator:tooltip"
        String: "If enabled, then an indicator above the characters head will show to the player as a visual way to let them know they can interact with this character."
      }
      Overrides {
        Name: "cs:indicator_offset:tooltip"
        String: "The offset of the indicator."
      }
      Overrides {
        Name: "cs:indicator_template:tooltip"
        String: "The indicator template to use for this character."
      }
      Overrides {
        Name: "cs:random:tooltip"
        String: "If enabled, then it will pick a random entry while respecting conditions."
      }
      Overrides {
        Name: "cs:animation_stance:tooltip"
        String: "The animation stance for this NPC."
      }
      Overrides {
        Name: "cs:animation_stance_playback_rate:tooltip"
        String: "The playback rate of the stance animation."
      }
      Overrides {
        Name: "cs:animation_stance_loop:tooltip"
        String: "If true then the animation stance will loop."
      }
      Overrides {
        Name: "cs:animation:tooltip"
        String: "The animation to play for this NPC."
      }
      Overrides {
        Name: "cs:animation_loop:tooltip"
        String: "If true then the animation will loop or go back to it\'s stance animation."
      }
      Overrides {
        Name: "cs:animation_playback_rate:tooltip"
        String: "The playback rate of the animation."
      }
      Overrides {
        Name: "cs:disable_abilities:tooltip"
        String: "Disables the player\'s abilities (i.e. like shooting a gun)."
      }
    }
  }
  SerializationVersion: 97
}
