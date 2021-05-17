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
  ChildIds: 16468380374726467520
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
      Name: "cs:bark_z_offset"
      Float: 25
    }
    Overrides {
      Name: "cs:name"
      String: "Anna"
    }
    Overrides {
      Name: "cs:bark_trigger"
      ObjectReference {
        SelfId: 11889108655073728109
      }
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
  Id: 16468380374726467520
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
  ChildIds: 15021462444649721418
  ChildIds: 13511535718909008405
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Hello."
    }
    Overrides {
      Name: "cs:id"
      Int: 2
    }
    Overrides {
      Name: "cs:condition"
      String: "function=test2"
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
  Id: 13511535718909008405
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
  ParentId: 16468380374726467520
  ChildIds: 9650987274104480528
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
  Id: 9650987274104480528
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
  ParentId: 13511535718909008405
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
  Id: 15021462444649721418
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
  ParentId: 16468380374726467520
  ChildIds: 16776914747815772490
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "What do you sell?"
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
  Id: 16776914747815772490
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
  ParentId: 15021462444649721418
  ChildIds: 8173875450662234528
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "I sell Beets, Peppers, Carrots, and Potatoes."
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
  Id: 8173875450662234528
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
  ParentId: 16776914747815772490
  ChildIds: 4997309628561227303
  ChildIds: 891301881204514962
  ChildIds: 4134511078051577965
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "I heard a rumor that people have started eating Sprouts again.  I shall have them in stock next week.  Would you be interested in buying some Sprouts?"
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
  Id: 4134511078051577965
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
  ParentId: 8173875450662234528
  ChildIds: 15250942885777818039
  ChildIds: 12463685819818824185
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
  Id: 12463685819818824185
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
  ParentId: 4134511078051577965
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
  Id: 15250942885777818039
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
  ParentId: 4134511078051577965
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
  Id: 891301881204514962
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
  ParentId: 8173875450662234528
  ChildIds: 6865876898755927479
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
  Id: 6865876898755927479
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
  ParentId: 891301881204514962
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
  Id: 4997309628561227303
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
  ParentId: 8173875450662234528
  ChildIds: 13690433080388678114
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Yes.  I love Sprouts.  Used to eat them all the time."
    }
    Overrides {
      Name: "cs:function"
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
      Id: 2057760776024245443
    }
  }
}
Objects {
  Id: 13690433080388678114
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
  ParentId: 4997309628561227303
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Excellent.  Come back soon then, shouldn\'t be long until I have stock.  Bye."
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
      String: "function=test"
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
      String: "I sell Beets, Peppers, Carrots, and Potatoes."
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
      String: "I heard a rumor that people have started eating Sprouts again.  I shall have them in stock next week.  Would you be interested in buying some Sprouts?"
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
  UnregisteredParameters {
    Overrides {
      Name: "cs:id"
      Int: 1
    }
    Overrides {
      Name: "cs:text"
      String: "Yes.  I love Sprouts.  Used to eat them all the time."
    }
    Overrides {
      Name: "cs:function"
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
      Id: 2057760776024245443
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
      String: "Excellent.  Come back soon then, shouldn\'t be long until I have stock.  Bye."
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
