Name: "NPCS"
RootId: 15871110639012851209
Objects {
  Id: 13874186321663312031
  Name: "Frank Rig"
  Transform {
    Location {
      X: 781.700684
      Y: -16.4720535
      Z: 116.928482
    }
    Rotation {
      Yaw: 158.527344
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15871110639012851209
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
  CoreMesh {
    MeshAsset {
      Id: 14883153065648214995
    }
    Teams {
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    AnimatedMesh {
      AnimationStance: "unarmed_idle_relaxed"
      AnimationStancePlaybackRate: 1
      AnimationStanceShouldLoop: true
      AnimationPlaybackRateMultiplier: 1
      PlayOnStartAnimation {
        PlaybackRate: 1
      }
      SkinnedMeshes {
        Id: 1820653124477737308
      }
      SkinnedMeshes {
        Id: 16980228390890474339
      }
      SkinnedMeshes {
        Id: 9453799039998797246
      }
      SkinnedMeshes {
        Id: 15332337160449812316
      }
    }
  }
}
Objects {
  Id: 343223679920606741
  Name: "Anna Rig"
  Transform {
    Location {
      X: -887.694031
      Y: -133.363098
      Z: 105
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
  ParentId: 15871110639012851209
  ChildIds: 11889108655073728109
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
      AnimationStance: "unarmed_idle_relaxed"
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
}
Objects {
  Id: 11889108655073728109
  Name: "Dialogue Trigger"
  Transform {
    Location {
      X: 145.15303
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 343223679920606741
  ChildIds: 9011802853514724951
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
}
Objects {
  Id: 9011802853514724951
  Name: "Trigger"
  Transform {
    Location {
      Z: 23.2596893
    }
    Rotation {
    }
    Scale {
      X: 2.74119449
      Y: 2.96516633
      Z: 2.32326341
    }
  }
  ParentId: 11889108655073728109
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
}
