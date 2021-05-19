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
  ChildIds: 6664719732819299231
  ChildIds: 734858588013941638
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
  Id: 734858588013941638
  Name: "Dialogue System"
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
  UnregisteredParameters {
    Overrides {
      Name: "cs:database"
      ObjectReference {
        SelfId: 2412817914691173764
      }
    }
    Overrides {
      Name: "cs:show_warnings"
      Bool: true
    }
    Overrides {
      Name: "cs:pulse_next_close_buttons"
      Bool: true
    }
    Overrides {
      Name: "cs:animate_letters"
      Bool: true
    }
    Overrides {
      Name: "cs:letter_speed"
      Float: 0.02
    }
    Overrides {
      Name: "cs:dialogue_template"
      AssetReference {
        Id: 1899279868236535734
      }
    }
    Overrides {
      Name: "cs:choice_template"
      AssetReference {
        Id: 13318269111076762700
      }
    }
    Overrides {
      Name: "cs:bark_template"
      AssetReference {
        Id: 4097836227533785736
      }
    }
    Overrides {
      Name: "cs:click_sound"
      ObjectReference {
        SelfId: 15726945316248996176
      }
    }
    Overrides {
      Name: "cs:type_sound"
      ObjectReference {
        SelfId: 1403386910390126912
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
}
Objects {
  Id: 6664719732819299231
  Name: "Dialogue System - Full Example"
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
    FilePartitionName: "Dialogue System - Full Example"
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
