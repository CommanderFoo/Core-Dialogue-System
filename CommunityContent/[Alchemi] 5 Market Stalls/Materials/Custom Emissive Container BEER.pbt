Assets {
  Id: 13018913720817006688
  Name: "Custom Emissive Container BEER"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 18280303351516875622
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 1
          G: 1
          B: 1
          A: 1
        }
      }
      Overrides {
        Name: "inner color"
        Color {
          R: 0.159999967
          G: 0.0540397242
          A: 1
        }
      }
      Overrides {
        Name: "top color"
        Color {
          R: 0.169999957
          G: 0.037152309
          A: 1
        }
      }
      Overrides {
        Name: "foam color"
        Color {
          R: 0.409999967
          G: 0.236225143
          A: 1
        }
      }
      Overrides {
        Name: "surface height"
        Float: 0.821155071
      }
      Overrides {
        Name: "foam edge speed"
        Float: 0.239706367
      }
      Overrides {
        Name: "foam thickness"
        Float: 40.31287
      }
      Overrides {
        Name: "edge width"
        Float: 1.59423459
      }
      Overrides {
        Name: "top edge foam distance"
        Float: 0.0238607731
      }
      Overrides {
        Name: "surface displacement amount"
        Float: 0.493210822
      }
      Overrides {
        Name: "speed"
        Float: 6.43933725
      }
      Overrides {
        Name: "wave scale multiplier"
        Float: 0.252405822
      }
      Overrides {
        Name: "top edge foam"
        Float: 0.400418788
      }
      Overrides {
        Name: "bubbles"
        Float: 1
      }
    }
    Assets {
      Id: 18280303351516875622
      Name: "Emissive Container Liquid"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_emissive_cutoff_liquid"
      }
    }
  }
}
