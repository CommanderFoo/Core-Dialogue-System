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
  ChildIds: 11550074651695267456
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
  Id: 11550074651695267456
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
        SelfId: 10479968696430413188
        SubObjectId: 10445891898565376587
        InstanceId: 5182657798257186647
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
        SelfId: 5405263219254959590
      }
    }
    Overrides {
      Name: "cs:type_sound"
      ObjectReference {
        SelfId: 2784589964642966085
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
      Name: "cs:click_progress"
      Bool: true
    }
    Overrides {
      Name: "cs:database:tooltip"
      String: "The database of conversations to use."
    }
    Overrides {
      Name: "cs:show_warnings:tooltip"
      String: "If enabled, then any issue with the system will be displayed in the Event Log."
    }
    Overrides {
      Name: "cs:pulse_next_close_buttons:tooltip"
      String: "If enabled, then \"Next\" and \"Exit\" buttons will pulse to be more visible to the player."
    }
    Overrides {
      Name: "cs:animate_letters:tooltip"
      String: "If enabled, then the letters of the text will animate in like a typing effect."
    }
    Overrides {
      Name: "cs:letter_speed:tooltip"
      String: "The speed of the animation effect."
    }
    Overrides {
      Name: "cs:dialogue_template:tooltip"
      String: "The dialogue template to use.  This can be changed at runtime."
    }
    Overrides {
      Name: "cs:choice_template:tooltip"
      String: "The template to use when displaying choices to the player.  This can be changed at runtime."
    }
    Overrides {
      Name: "cs:click_sound:tooltip"
      String: "The sound to use when the player clicks on the dialogue and buttons."
    }
    Overrides {
      Name: "cs:type_sound:tooltip"
      String: "The sound to use for the typing effect."
    }
    Overrides {
      Name: "cs:play_click_sound:tooltip"
      String: "If enabled, the click sound will be played."
    }
    Overrides {
      Name: "cs:play_type_sound:tooltip"
      String: "If enabled, the type sound will be played."
    }
    Overrides {
      Name: "cs:min_speaker_width:tooltip"
      String: "The min width of the speaker element that shows the name of the NPC / You.  This is dynamically set for each entry."
    }
    Overrides {
      Name: "cs:click_progress:tooltip"
      String: "If enabled, then the player does not need to click on the Next or Close button to progress the dialogue."
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
    SelfId: 11550074651695267456
    SubobjectId: 4184247561182906195
    InstanceId: 9732342375738209615
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
