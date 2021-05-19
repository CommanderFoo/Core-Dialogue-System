Name: "NPCS"
RootId: 15871110639012851209
Objects {
  Id: 3707234134964831453
  Name: "Blue"
  Transform {
    Location {
      X: 48.6906433
      Y: -846.513306
      Z: 118.557693
    }
    Rotation {
      Yaw: 79.1468201
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15871110639012851209
  ChildIds: 2496630907125746636
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
        Animation: "unarmed_love"
        PlaybackRate: 1
      }
      SkinnedMeshes {
        Id: 3622582349030131855
      }
      SkinnedMeshes {
        Id: 7767402344927792788
      }
      SkinnedMeshes {
        Id: 5791350722017768665
      }
      SkinnedMeshes {
        Id: 3399877176517748882
      }
    }
  }
}
Objects {
  Id: 2496630907125746636
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
  ParentId: 3707234134964831453
  ChildIds: 5538635815341434941
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
  Id: 5538635815341434941
  Name: "Trigger"
  Transform {
    Location {
      X: 224.467621
      Y: 40.6696
      Z: 23.2596741
    }
    Rotation {
      Yaw: 9.91349602
    }
    Scale {
      X: 2.74119186
      Y: 5.30693293
      Z: 2.32326341
    }
  }
  ParentId: 2496630907125746636
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
Objects {
  Id: 17572344891566394226
  Name: "Nya"
  Transform {
    Location {
      X: -857.265686
      Y: 295.083954
      Z: 116.907333
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
  ChildIds: 17995689434230463628
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
        Animation: "unarmed_boo"
        PlaybackRate: 1
      }
      SkinnedMeshes {
        Id: 16297770347264281756
      }
      SkinnedMeshes {
        Id: 8333871476585465334
      }
      SkinnedMeshes {
        Id: 844314210539087621
      }
      SkinnedMeshes {
        Id: 2451400738300129994
      }
    }
  }
}
Objects {
  Id: 17995689434230463628
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
  ParentId: 17572344891566394226
  ChildIds: 17489156410382316638
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
  Id: 17489156410382316638
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
  ParentId: 17995689434230463628
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
Objects {
  Id: 6942673924813495597
  Name: "Scav"
  Transform {
    Location {
      X: 195.437012
      Y: 868.821
      Z: 116.928452
    }
    Rotation {
      Yaw: -126.62146
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15871110639012851209
  ChildIds: 12095496513048212212
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
        Animation: "unarmed_ready_to_rumble"
        PlaybackRate: 1
      }
      SkinnedMeshes {
        Id: 473576503562924839
      }
      SkinnedMeshes {
        Id: 5601351913280883859
      }
      SkinnedMeshes {
        Id: 4255046600146809822
      }
      SkinnedMeshes {
        Id: 4490033841864965945
      }
    }
  }
}
Objects {
  Id: 12095496513048212212
  Name: "Dialogue Trigger"
  Transform {
    Location {
      X: -2.79279539e-06
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 6942673924813495597
  ChildIds: 12668865060372676351
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
  Id: 12668865060372676351
  Name: "Trigger"
  Transform {
    Location {
      X: 246.510651
      Y: 92.8654327
      Z: 23.2596893
    }
    Rotation {
      Yaw: 17.1291065
    }
    Scale {
      X: 2.74119449
      Y: 2.96516633
      Z: 2.32326341
    }
  }
  ParentId: 12095496513048212212
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
Objects {
  Id: 13874186321663312031
  Name: "Buck"
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
  ChildIds: 11889108655073728109
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
        Animation: "unarmed_drink"
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
  Id: 11889108655073728109
  Name: "Dialogue Trigger"
  Transform {
    Location {
      X: -2.79279539e-06
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 13874186321663312031
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
      X: 246.510651
      Y: 92.8654327
      Z: 23.2596893
    }
    Rotation {
      Yaw: 17.1291065
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
Objects {
  Id: 343223679920606741
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
  ParentId: 15871110639012851209
  ChildIds: 16627581688238781044
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
}
Objects {
  Id: 16627581688238781044
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
  ParentId: 343223679920606741
  ChildIds: 10854891342487534385
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
  Id: 10854891342487534385
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
  ParentId: 16627581688238781044
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
