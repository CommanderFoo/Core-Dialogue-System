Name: "Root"
RootId: 4781671109827199097
Objects {
  Id: 4781671109827199097
  Name: "Root"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ChildIds: 2848436028829331738
  ChildIds: 9566678969520881450
  ChildIds: 2365162281000420148
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:forceon"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Folder {
  }
}
Objects {
  Id: 2365162281000420148
  Name: "Dialogue System - Advanced Example"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 17081892972689086649
      value {
        Overrides {
          Name: "Name"
          String: "Dialogue System - Advanced Example"
        }
        Overrides {
          Name: "Position"
          Vector {
          }
        }
        Overrides {
          Name: "Rotation"
          Rotator {
          }
        }
      }
    }
    TemplateAsset {
      Id: 6755024686228237351
    }
  }
}
Objects {
  Id: 9566678969520881450
  Name: "Dialogue System"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  UnregisteredParameters {
    Overrides {
      Name: "cs:database"
      ObjectReference {
        SelfId: 12383069810585240795
        SubObjectId: 10445891898565376587
        InstanceId: 2365162281000420148
        TemplateId: 6755024686228237351
      }
    }
    Overrides {
      Name: "cs:show_warnings"
      Bool: true
    }
    Overrides {
      Name: "cs:pulse_next_close_buttons"
      Bool: false
    }
    Overrides {
      Name: "cs:animate_letters"
      Bool: true
    }
    Overrides {
      Name: "cs:letter_speed"
      Float: 0.03
    }
    Overrides {
      Name: "cs:dialogue_template"
      AssetReference {
        Id: 15941761266032416982
      }
    }
    Overrides {
      Name: "cs:choice_template"
      AssetReference {
        Id: 15135186260489409822
      }
    }
    Overrides {
      Name: "cs:click_sound"
      ObjectReference {
        SelfId: 8037493938369256524
      }
    }
    Overrides {
      Name: "cs:type_sound"
      ObjectReference {
        SelfId: 156897786969627631
      }
    }
    Overrides {
      Name: "cs:play_click_sound"
      Bool: true
    }
    Overrides {
      Name: "cs:play_type_sound"
      Bool: true
    }
    Overrides {
      Name: "cs:min_speaker_width"
      Float: 125
    }
    Overrides {
      Name: "cs:database:tooltip"
      String: "This is the database of all your NPC conversations."
    }
    Overrides {
      Name: "cs:show_warnings:tooltip"
      String: "If enabled, warnings will be shown in the event log."
    }
    Overrides {
      Name: "cs:pulse_next_close_buttons:tooltip"
      String: "If enabled, then dialogue close and next buttons will pulse to get the players attention."
    }
    Overrides {
      Name: "cs:animate_letters:tooltip"
      String: "If enabled, then the dialogue text will animate in like a typing effect."
    }
    Overrides {
      Name: "cs:letter_speed:tooltip"
      String: "The speed of the letter animation of the dialogue text."
    }
    Overrides {
      Name: "cs:dialogue_template:tooltip"
      String: "The dialogue template to use.  For on the fly switching at runtime, see docs."
    }
    Overrides {
      Name: "cs:choice_template:tooltip"
      String: "The player choices template.  See docs for more info."
    }
    Overrides {
      Name: "cs:click_sound:tooltip"
      String: "The sound to play when the player clicks."
    }
    Overrides {
      Name: "cs:type_sound:tooltip"
      String: "The sound when the letter animation is playing."
    }
    Overrides {
      Name: "cs:play_click_sound:tooltip"
      String: "Turn off / on the click sound."
    }
    Overrides {
      Name: "cs:play_type_sound:tooltip"
      String: "Turn off / on the type sound when animating the letters."
    }
    Overrides {
      Name: "cs:min_speaker_width:tooltip"
      String: "The minimum width of the speaker element that holds the NPC name.  The system dynamically sets the width."
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Folder {
    IsFilePartition: true
    FilePartitionName: "Dialogue System"
  }
  InstanceHistory {
    SelfId: 9566678969520881450
    SubobjectId: 4184247561182906195
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
    WasRoot: true
  }
}
Objects {
  Id: 2848436028829331738
  Name: "Misc"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Folder {
    IsFilePartition: true
    FilePartitionName: "Misc"
  }
}
