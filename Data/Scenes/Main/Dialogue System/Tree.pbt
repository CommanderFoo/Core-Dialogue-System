Name: "Dialogue System"
RootId: 734858588013941638
Objects {
  Id: 2412817914691173764
  Name: "Database"
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
  ParentId: 734858588013941638
  ChildIds: 1657394216441420399
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
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
  NetworkContext {
  }
}
Objects {
  Id: 1657394216441420399
  Name: "Dialogue_Conversation"
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
  ParentId: 2412817914691173764
  ChildIds: 4837929547057674618
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
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
      Name: "cs:hide_reticle"
      Bool: true
    }
    Overrides {
      Name: "cs:disable_player_jump"
      Bool: true
    }
    Overrides {
      Name: "cs:disable_player_crouch"
      Bool: true
    }
    Overrides {
      Name: "cs:disable_player_mount"
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
      Name: "cs:dialogue_trigger"
      ObjectReference {
        SelfId: 11889108655073728109
      }
    }
    Overrides {
      Name: "cs:bark_trigger"
      ObjectReference {
        SelfId: 18162321314436021062
      }
    }
    Overrides {
      Name: "cs:bark_z_offset"
      Float: 25
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
  Script {
    ScriptAsset {
      Id: 7370136930858803589
    }
  }
}
Objects {
  Id: 4837929547057674618
  Name: "Dialogue_Conversation_Entry"
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
  ParentId: 1657394216441420399
  ChildIds: 745483836719801384
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Hello there!  You are new here I see?"
    }
    Overrides {
      Name: "cs:id"
      Int: 1
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
  Script {
    ScriptAsset {
      Id: 17875573452928307
    }
  }
}
Objects {
  Id: 745483836719801384
  Name: "Dialogue_Conversation_Entry"
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
  ParentId: 4837929547057674618
  ChildIds: 8309487413131929079
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Did you not notice Pippen?"
    }
    Overrides {
      Name: "cs:id"
      Int: 1
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
  Script {
    ScriptAsset {
      Id: 17875573452928307
    }
  }
}
Objects {
  Id: 8309487413131929079
  Name: "Dialogue_Conversation_Entry"
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
  ParentId: 745483836719801384
  ChildIds: 7719310576687604616
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "She was over near the pond look for golden fish for the fair."
    }
    Overrides {
      Name: "cs:id"
      Int: 1
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
  Script {
    ScriptAsset {
      Id: 17875573452928307
    }
  }
}
Objects {
  Id: 7719310576687604616
  Name: "Dialogue_Conversation_Entry"
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
  ParentId: 8309487413131929079
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Apparently they sell for quite a bit of money at the market, so if you need money, grab a fishing rod from old man Henry."
    }
    Overrides {
      Name: "cs:id"
      Int: 1
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
  Script {
    ScriptAsset {
      Id: 17875573452928307
    }
  }
}
Objects {
  Id: 4461796650537044528
  Name: "System"
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
  ParentId: 734858588013941638
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
    FilePartitionName: "System"
  }
}
Objects {
  Id: 17184191745692017502
  Name: "README"
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
  ParentId: 734858588013941638
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
  Script {
    ScriptAsset {
      Id: 4934700835160161619
    }
  }
}
