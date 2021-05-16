Assets {
  Id: 11732178682834108420
  Name: "Custom -Canal Water"
  PlatformAssetType: 13
  SerializationVersion: 84
  CustomMaterialAsset {
    BaseMaterialId: 2105530983867805765
    ParameterOverrides {
      Overrides {
        Name: "flow direction"
        Vector {
          Y: -1
          Z: 0.2
        }
      }
      Overrides {
        Name: "edge foam brightness"
        Float: 0.459513396
      }
      Overrides {
        Name: "u_tiles"
        Float: 0.192338198
      }
      Overrides {
        Name: "v_tiles"
        Float: 0.487808883
      }
      Overrides {
        Name: "deep color"
        Color {
          G: 0.0399999619
          B: 0.0272847489
          A: 1
        }
      }
      Overrides {
        Name: "shallow color"
        Color {
          G: 0.159999967
          B: 0.115496688
          A: 1
        }
      }
      Overrides {
        Name: "opacity"
        Float: 0.961813569
      }
      Overrides {
        Name: "opacity distance"
        Float: 496.447235
      }
      Overrides {
        Name: "reflection brightness"
        Float: 0.37087217
      }
      Overrides {
        Name: "normal amount"
        Float: 0.267457426
      }
      Overrides {
        Name: "edge normal flattening"
        Float: 0.274844199
      }
      Overrides {
        Name: "wind speed"
        Float: 0.260070652
      }
      Overrides {
        Name: "object displacement amount"
        Float: 0.33393833
      }
      Overrides {
        Name: "foam tightness"
        Float: 13.4745932
      }
      Overrides {
        Name: "normal foam brightness"
        Float: 0.05
      }
      Overrides {
        Name: "foam shift"
        Float: -0.346896827
      }
      Overrides {
        Name: "foam shape min"
        Float: 0.304391265
      }
      Overrides {
        Name: "foam shape max"
        Float: 0.629409
      }
      Overrides {
        Name: "foam shape"
        Float: 1.8910135
      }
    }
    Assets {
      Id: 2105530983867805765
      Name: "Generic Water"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_parameter_driven_water_manual"
      }
    }
  }
}
