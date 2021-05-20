Name: "NPCS"
RootId: 9558066992973698842
Objects {
  Id: 5982495252400585845
  Name: "Tobs"
  Transform {
    Location {
      X: -887.694031
      Y: -133.363098
      Z: 113.408173
    }
    Rotation {
      Yaw: -19.4717102
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 9558066992973698842
  ChildIds: 7481626518369690821
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
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
  CoreMesh {
    MeshAsset {
      Id: 1350760558773722215
    }
    Teams {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    AnimatedMesh {
      AnimationStance: "unarmed_wave"
      AnimationStancePlaybackRate: 1
      AnimationStanceShouldLoop: true
      AnimationPlaybackRateMultiplier: 1
      PlayOnStartAnimation {
        PlaybackRate: 1
      }
      SkinnedMeshes {
        Id: 16297770347264281756
      }
      SkinnedMeshes {
        Id: 1859670270835122744
      }
      SkinnedMeshes {
        Id: 9070916920465203190
      }
      SkinnedMeshes {
        Id: 7100317809665595935
      }
    }
  }
  InstanceHistory {
    SelfId: 5982495252400585845
    SubobjectId: 4330868065102040140
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 7481626518369690821
  Name: "Dialogue Trigger"
  Transform {
    Location {
      X: -5.75443228e-05
      Y: -2.03455438e-05
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 5982495252400585845
  ChildIds: 1951675774315086264
  UnregisteredParameters {
    Overrides {
      Name: "cs:interaction_label"
      String: "Talk"
    }
    Overrides {
      Name: "cs:interactable"
      Bool: true
    }
    Overrides {
      Name: "cs:trigger_event"
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
  NetworkContext {
  }
  InstanceHistory {
    SelfId: 7481626518369690821
    SubobjectId: 632845489663956220
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
Objects {
  Id: 1951675774315086264
  Name: "Trigger"
  Transform {
    Location {
      X: 139.990952
      Y: 24.4734097
      Z: 23.2596741
    }
    Rotation {
    }
    Scale {
      X: 2.74119449
      Y: 2.96516633
      Z: 2.32326341
    }
  }
  ParentId: 7481626518369690821
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:alwaysvisible"
  }
  Trigger {
    TeamSettings {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    TriggerShape_v2 {
      Value: "mc:etriggershape:box"
    }
  }
  InstanceHistory {
    SelfId: 1951675774315086264
    SubobjectId: 8361492315951919489
    InstanceId: 7544004611546038835
    TemplateId: 16916517123575277321
  }
}
