Name: "Scripts"
RootId: 3366839176774632114
Objects {
  Id: 12759089202779363550
  Name: "Client"
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
  ParentId: 3366839176774632114
  ChildIds: 2336350306981247653
  ChildIds: 3796060113660089223
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
  Id: 3796060113660089223
  Name: "Dialogue_System_Example_UI_Client"
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
  ParentId: 12759089202779363550
  UnregisteredParameters {
    Overrides {
      Name: "cs:YOOTIL"
      AssetReference {
        Id: 16622261663679835299
      }
    }
    Overrides {
      Name: "cs:coin_amount"
      ObjectReference {
        SelfId: 7062400768108508671
      }
    }
    Overrides {
      Name: "cs:beet_amount"
      ObjectReference {
        SelfId: 7735479861975585601
      }
    }
    Overrides {
      Name: "cs:carrot_amount"
      ObjectReference {
        SelfId: 7968457346058975262
      }
    }
    Overrides {
      Name: "cs:fish_amount"
      ObjectReference {
        SelfId: 3898449129256177409
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
      Id: 5576956740595571354
    }
  }
}
Objects {
  Id: 2336350306981247653
  Name: "Dialogue_System_Example_Client"
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
  ParentId: 12759089202779363550
  UnregisteredParameters {
    Overrides {
      Name: "cs:Dialogue_System"
      AssetReference {
        Id: 15701775483694138635
      }
    }
    Overrides {
      Name: "cs:corehaven_dialogue_theme"
      AssetReference {
        Id: 13735474820329846356
      }
    }
    Overrides {
      Name: "cs:corehaven_choices_theme"
      AssetReference {
        Id: 11736449952175418330
      }
    }
    Overrides {
      Name: "cs:animal_crossing_dialogue_theme"
      AssetReference {
        Id: 15941761266032416982
      }
    }
    Overrides {
      Name: "cs:animal_crossing_choices_theme"
      AssetReference {
        Id: 15135186260489409822
      }
    }
    Overrides {
      Name: "cs:persona_dialogue_theme"
      AssetReference {
        Id: 15263836994431999773
      }
    }
    Overrides {
      Name: "cs:persona_choices_theme"
      AssetReference {
        Id: 10288626534306247967
      }
    }
    Overrides {
      Name: "cs:basic_dialogue_theme"
      AssetReference {
        Id: 9349324878412755115
      }
    }
    Overrides {
      Name: "cs:basic_choices_theme"
      AssetReference {
        Id: 1978131249952277561
      }
    }
    Overrides {
      Name: "cs:simple_dialogue_theme"
      AssetReference {
        Id: 1899279868236535734
      }
    }
    Overrides {
      Name: "cs:simple_choice_theme"
      AssetReference {
        Id: 13318269111076762700
      }
    }
    Overrides {
      Name: "cs:tobs_npc"
      ObjectReference {
        SelfId: 343223679920606741
      }
    }
    Overrides {
      Name: "cs:nya_npc"
      ObjectReference {
        SelfId: 17572344891566394226
      }
    }
    Overrides {
      Name: "cs:blue_npc"
      ObjectReference {
        SelfId: 3707234134964831453
      }
    }
    Overrides {
      Name: "cs:scav_npc"
      ObjectReference {
        SelfId: 6942673924813495597
      }
    }
    Overrides {
      Name: "cs:buck_npc"
      ObjectReference {
        SelfId: 13874186321663312031
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
      Id: 15539963568773032512
    }
  }
}
Objects {
  Id: 7516371398583130565
  Name: "Server"
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
  ParentId: 3366839176774632114
  ChildIds: 1286956899126134419
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
  NetworkContext {
    Type: Server
  }
}
Objects {
  Id: 1286956899126134419
  Name: "Dialogue_System_Example_Server"
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
  ParentId: 7516371398583130565
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
      Id: 11176679536674183518
    }
  }
}
