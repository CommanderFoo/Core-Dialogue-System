Assets {
  Id: 14253404521150788822
  Name: "Dialogue System - Basic Example"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 8558929229171950540
      Objects {
        Id: 8558929229171950540
        Name: "Dialogue System - Basic Example"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 3580054066914520204
        ChildIds: 16428396548400201455
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
          FilePartitionName: "Dialogue System - Full Example"
        }
      }
      Objects {
        Id: 3580054066914520204
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
        ParentId: 8558929229171950540
        ChildIds: 16936014304001620531
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
        Id: 16936014304001620531
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
        ParentId: 3580054066914520204
        ChildIds: 17064443972558579755
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
              SubObjectId: 10753123951342540132
            }
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
        Id: 17064443972558579755
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
        ParentId: 16936014304001620531
        ChildIds: 5471917692580842799
        ChildIds: 4113170446990843368
        UnregisteredParameters {
          Overrides {
            Name: "cs:text"
            String: "Hello {name}, how are you doing today?"
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
        Id: 5471917692580842799
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
        ParentId: 17064443972558579755
        ChildIds: 11253241890116631003
        UnregisteredParameters {
          Overrides {
            Name: "cs:id"
            Int: 1
          }
          Overrides {
            Name: "cs:text"
            String: "Very Good.  Thanks for asking."
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
        Id: 11253241890116631003
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
        ParentId: 5471917692580842799
        UnregisteredParameters {
          Overrides {
            Name: "cs:id"
            Int: 1
          }
          Overrides {
            Name: "cs:text"
            String: "That is awesome to hear.  Bye."
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
        Id: 4113170446990843368
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
        ParentId: 17064443972558579755
        ChildIds: 6027879916581513225
        UnregisteredParameters {
          Overrides {
            Name: "cs:id"
            Int: 2
          }
          Overrides {
            Name: "cs:text"
            String: "Not too bad.  Thanks."
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
        Id: 6027879916581513225
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
        ParentId: 4113170446990843368
        UnregisteredParameters {
          Overrides {
            Name: "cs:id"
            Int: 1
          }
          Overrides {
            Name: "cs:text"
            String: "Tomorrow might be a better day.  Bye."
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
        Id: 16428396548400201455
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
        ParentId: 8558929229171950540
        ChildIds: 2144461488014000893
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
        Id: 2144461488014000893
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
        ParentId: 16428396548400201455
        ChildIds: 10753123951342540132
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
        Id: 10753123951342540132
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
        ParentId: 2144461488014000893
        ChildIds: 13038152751414575797
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
        Id: 13038152751414575797
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
        ParentId: 10753123951342540132
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
