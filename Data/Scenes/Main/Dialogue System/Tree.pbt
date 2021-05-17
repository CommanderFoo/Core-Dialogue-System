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
  ChildIds: 4950912050059469826
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
  Id: 4950912050059469826
  Name: "Bill"
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
  ChildIds: 17998314145095868890
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:name"
      String: "Bill"
    }
    Overrides {
      Name: "cs:dialogue_trigger"
      ObjectReference {
        SelfId: 11889108655073728109
      }
    }
    Overrides {
      Name: "cs:call_event"
      String: "update_spoke_to_bill"
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
  Id: 17998314145095868890
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
  ParentId: 4950912050059469826
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Hi, go see Anna."
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
  ChildIds: 5257906470984175269
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
      String: "test"
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
  Id: 5257906470984175269
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
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:text"
      String: "Please talk to Bill first."
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
  ChildIds: 3033671169890378205
  ChildIds: 16930933977056539841
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Hello {name}, I see you have {resource=money,true,false}, and wow, you have {resource=carrot,true}."
    }
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:condition"
      String: "function=spoke_to_bill"
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
  Id: 16930933977056539841
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
  ParentId: 4837929547057674618
  ChildIds: 257648985551252465
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Nothing.  Bye."
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
  Id: 257648985551252465
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
  ParentId: 16930933977056539841
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Am always here if you need quality vegetables.  Bye."
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
  ParentId: 4837929547057674618
  ChildIds: 16223991889343750969
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "What do you sell?"
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
  Id: 16223991889343750969
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
  ChildIds: 15315314588308445471
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "{name} I sell Beets, Peppers, Carrots, and Potatoes."
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
  Id: 15315314588308445471
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
  ParentId: 16223991889343750969
  ChildIds: 14358767075615608882
  ChildIds: 14240392426666694521
  ChildIds: 11101790178774987497
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "{name} I heard a rumor that people have started eating Sprouts again.  I shall have them in stock next week.  Would you be interested in buying some Sprouts?"
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
  Id: 11101790178774987497
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
  ParentId: 15315314588308445471
  ChildIds: 6062040215820489566
  ChildIds: 11046556230018697833
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 3
    }
    Overrides {
      Name: "cs:text"
      String: "I\'ll buy some carrots please."
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
  Id: 11046556230018697833
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
  ParentId: 11101790178774987497
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:text"
      String: "Sorry, I don\'t have any in stock today.  Come back tomorrow."
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
  Id: 6062040215820489566
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
  ParentId: 11101790178774987497
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "But you don\'t need any, you already have {resource=carrots,true}"
    }
    Overrides {
      Name: "cs:condition"
      String: "{resource=carrot,condition=>0}"
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
  Id: 14240392426666694521
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
  ParentId: 15315314588308445471
  ChildIds: 15403967427285033265
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:text"
      String: "No.  I don\'t like them.  Yuck!"
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
  Id: 15403967427285033265
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
  ParentId: 14240392426666694521
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Ok.  Bye."
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
  Id: 14358767075615608882
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
  ParentId: 15315314588308445471
  ChildIds: 9807898903108775427
  ChildIds: 12626910130349464302
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "{name} Yes.  I love Sprouts.  Used to eat them all the time."
    }
    Overrides {
      Name: "cs:function"
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
      Id: 2057760776024245443
    }
  }
}
Objects {
  Id: 12626910130349464302
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
  ParentId: 14358767075615608882
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:text"
      String: "Bye {name}"
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
  Id: 9807898903108775427
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
  ParentId: 14358767075615608882
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "{name} Excellent.  Come back soon then, shouldn\'t be long until I have stock.  Bye."
    }
    Overrides {
      Name: "cs:condition"
      String: "resource=money;==9999"
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
