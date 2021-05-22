Assets {
  Id: 16916517123575277321
  Name: "Dialogue System - Condition Example 2"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 3332168816084943629
      Objects {
        Id: 3332168816084943629
        Name: "Dialogue System - Basic Condition Example 2"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 1507664606607328789
        ChildIds: 16985697051467900707
        UnregisteredParameters {
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
        }
      }
      Objects {
        Id: 1507664606607328789
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
        ParentId: 3332168816084943629
        ChildIds: 13865100726748863989
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
      }
      Objects {
        Id: 13865100726748863989
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
        ParentId: 1507664606607328789
        ChildIds: 6736632562147765718
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
              SubObjectId: 632845489663956220
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
      }
      Objects {
        Id: 6736632562147765718
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
        ParentId: 13865100726748863989
        ChildIds: 4609776353916000885
        ChildIds: 438579824111404499
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
      }
      Objects {
        Id: 4609776353916000885
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
        ParentId: 6736632562147765718
        ChildIds: 108301497835329129
        ChildIds: 5891630764131563515
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
      }
      Objects {
        Id: 108301497835329129
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
        ParentId: 4609776353916000885
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
      }
      Objects {
        Id: 5891630764131563515
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
        ParentId: 4609776353916000885
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
      }
      Objects {
        Id: 438579824111404499
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
        ParentId: 6736632562147765718
        ChildIds: 15062961674947276243
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
      }
      Objects {
        Id: 15062961674947276243
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
        ParentId: 438579824111404499
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
      }
      Objects {
        Id: 16985697051467900707
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
        ParentId: 3332168816084943629
        ChildIds: 4330868065102040140
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
      }
      Objects {
        Id: 4330868065102040140
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
        ParentId: 16985697051467900707
        ChildIds: 632845489663956220
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
        Id: 632845489663956220
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
        ParentId: 4330868065102040140
        ChildIds: 8361492315951919489
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
        Id: 8361492315951919489
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
        ParentId: 632845489663956220
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
    }
    Assets {
      Id: 1350760558773722215
      Name: "Humanoid 1 Rig"
      PlatformAssetType: 25
      PrimaryAsset {
        AssetType: "SkeletonAssetRef"
        AssetId: "npc_gal_wireframe_001_ref"
      }
    }
    Assets {
      Id: 16297770347264281756
      Name: "Humanoid 1 Sonia"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_head_sport_001_ref"
      }
    }
    Assets {
      Id: 1859670270835122744
      Name: "Humanoid 1 Hoodie"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_upper_casual_001_ref"
      }
    }
    Assets {
      Id: 9070916920465203190
      Name: "Humanoid 1 Viper Helmet"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_hat_scifi_001_ref"
      }
    }
    Assets {
      Id: 7100317809665595935
      Name: "Humanoid 1 Capri Pants"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_gal_lower_clothing_003_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 85
  DirectlyPublished: true
}
