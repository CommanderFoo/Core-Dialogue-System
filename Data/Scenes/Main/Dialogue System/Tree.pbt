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
  Name: "Anna"
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
        SelfId: 16627581688238781044
      }
    }
    Overrides {
      Name: "cs:bark_z_offset"
      Float: 25
    }
    Overrides {
      Name: "cs:name"
      String: "Anna"
    }
    Overrides {
      Name: "cs:call_event"
      String: ""
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
  ChildIds: 4918306764782692209
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Hello {name}.  I sell some of the best vegetables in the district.  No other vender can beat me for quality and price."
    }
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:condition"
      String: ""
    }
    Overrides {
      Name: "cs:call_event"
      String: ""
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
  Id: 4918306764782692209
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
  ChildIds: 3033671169890378205
  ChildIds: 3264869543617407345
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "{name}, did you know that I was #1 in the district 5 years in a row?"
    }
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:call_event"
      String: ""
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
  Id: 3264869543617407345
  Name: "Dialogue_Player_Choice"
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
  ParentId: 4918306764782692209
  ChildIds: 5961066303790532181
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:text"
      String: "Yes."
    }
    Overrides {
      Name: "cs:call_event"
      String: ""
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
      Id: 2057760776024245443
    }
  }
}
Objects {
  Id: 5961066303790532181
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
  ParentId: 3264869543617407345
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Amazing.  I think I remember seeing you last year near talking to Bill.  Our community is super duper.  Hope to see you again this year."
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
  Id: 3033671169890378205
  Name: "Dialogue_Player_Choice"
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
  ParentId: 4918306764782692209
  ChildIds: 11400476513196408983
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "No. {name}"
    }
    Overrides {
      Name: "cs:call_event"
      String: ""
    }
    Overrides {
      Name: "cs:function"
      String: ""
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
      Id: 2057760776024245443
    }
  }
}
Objects {
  Id: 11400476513196408983
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
  ParentId: 3033671169890378205
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Oh that is too bad.  I am entering again this year, so maybe you could come along and watch the show?  It will be a lot of fun, trust me."
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
