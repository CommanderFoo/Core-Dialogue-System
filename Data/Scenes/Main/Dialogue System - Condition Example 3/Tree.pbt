Name: "Dialogue System - Condition Example 3"
RootId: 4693454298889138996
Objects {
  Id: 9558066992973698842
  Name: "NPCS"
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
  ParentId: 4693454298889138996
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
    FilePartitionName: "NPCS"
  }
  InstanceHistory {
    SelfId: 9558066992973698842
    SubobjectId: 16985697051467900707
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 8930654329035290156
  Name: "Dialogue System Database"
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
  ParentId: 4693454298889138996
  ChildIds: 12643567425998155212
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:forceoff"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  NetworkContext {
  }
  InstanceHistory {
    SelfId: 8930654329035290156
    SubobjectId: 1507664606607328789
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 12643567425998155212
  Name: "Tobs"
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
  ParentId: 8930654329035290156
  ChildIds: 3630202208988175855
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
        SelfId: 7481626518369690821
      }
    }
    Overrides {
      Name: "cs:bark_z_offset"
      Float: 25
    }
    Overrides {
      Name: "cs:name"
      String: "Tobs"
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
      Name: "cs:repeat_dialogue"
      Bool: true
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
  InstanceHistory {
    SelfId: 12643567425998155212
    SubobjectId: 13865100726748863989
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 3630202208988175855
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
  ParentId: 12643567425998155212
  ChildIds: 5829194042895313484
  ChildIds: 7568972306125551082
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Hello, is your name CommanderFoo?"
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
  InstanceHistory {
    SelfId: 3630202208988175855
    SubobjectId: 6736632562147765718
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 7568972306125551082
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
  ParentId: 3630202208988175855
  ChildIds: 13697172586075495914
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "No."
    }
    Overrides {
      Name: "cs:id"
      Int: 2
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
  InstanceHistory {
    SelfId: 7568972306125551082
    SubobjectId: 438579824111404499
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 13697172586075495914
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
  ParentId: 7568972306125551082
  UnregisteredParameters {
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
  InstanceHistory {
    SelfId: 13697172586075495914
    SubobjectId: 15062961674947276243
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 5829194042895313484
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
  ParentId: 3630202208988175855
  ChildIds: 7970387896478705232
  ChildIds: 4530344996785784770
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Yes."
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
  InstanceHistory {
    SelfId: 5829194042895313484
    SubobjectId: 4609776353916000885
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 4530344996785784770
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
  ParentId: 5829194042895313484
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "LIES!!.  Your name is {name},  not CommanderFoo."
    }
    Overrides {
      Name: "cs:id"
      Int: 2
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
  InstanceHistory {
    SelfId: 4530344996785784770
    SubobjectId: 5891630764131563515
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 7970387896478705232
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
  ParentId: 5829194042895313484
  UnregisteredParameters {
    Overrides {
      Name: "cs:text"
      String: "Well hello there {name}."
    }
    Overrides {
      Name: "cs:condition"
      String: "name=CommanderFoo"
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
  InstanceHistory {
    SelfId: 7970387896478705232
    SubobjectId: 108301497835329129
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
