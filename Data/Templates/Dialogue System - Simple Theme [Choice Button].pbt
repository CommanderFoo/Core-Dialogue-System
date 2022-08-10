Assets {
  Id: 13318269111076762700
  Name: "Dialogue System - Simple Theme [Choice Button]"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 14458413053716715705
      Objects {
        Id: 14458413053716715705
        Name: "Dialogue System - Simple Theme [Choice Button]"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11627169824975117474
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
        Control {
          Height: 40
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          IsHittable: true
          Button {
            FontColor {
              G: 0.0946925133
              B: 0.259374946
              A: 1
            }
            FontSize: 21
            ButtonColor {
              R: 1
              G: 1
              B: 1
            }
            HoveredColor {
              R: 1
              G: 0.538
              B: 0.538
              A: 0.3
            }
            PressedColor {
              R: 1
              G: 0.538
              B: 0.538
              A: 0.3
            }
            DisabledColor {
              R: 1
              G: 1
              B: 1
            }
            Brush {
              Id: 8351216148881258287
            }
            IsButtonEnabled: true
            ClickMode {
              Value: "mc:ebuttonclickmode:default"
            }
            Font {
              Id: 16335491782417957814
            }
            Justification {
              Value: "mc:etextjustify:left"
            }
            VerticalJustification {
              Value: "mc:everticaljustification:center"
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
    }
    Assets {
      Id: 8351216148881258287
      Name: "BG Flat 004"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "BackgroundNoOutline_22"
      }
    }
    Assets {
      Id: 16335491782417957814
      Name: "Teko"
      PlatformAssetType: 28
      PrimaryAsset {
        AssetType: "FontAssetRef"
        AssetId: "TekoRegular_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 118
  DirectlyPublished: true
  VirtualFolderPath: "Dialogue System"
  VirtualFolderPath: "Themes"
}
