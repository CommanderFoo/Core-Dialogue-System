Assets {
  Id: 14238536960846815153
  Name: "Custom - Water for Wheel"
  PlatformAssetType: 13
  SerializationVersion: 84
  CustomMaterialAsset {
    BaseMaterialId: 2105530983867805765
    ParameterOverrides {
      Overrides {
        Name: "flow direction"
        Vector {
          Y: -5
          Z: -90
        }
      }
      Overrides {
        Name: "edge foam brightness"
        Float: 0.22313638
      }
      Overrides {
        Name: "u_tiles"
        Float: 1.92822635
      }
      Overrides {
        Name: "v_tiles"
        Float: 2.18676305
      }
      Overrides {
        Name: "deep color"
        Color {
          G: 0.141324401
          B: 0.220000029
          A: 1
        }
      }
      Overrides {
        Name: "shallow color"
        Color {
          G: 0.21099323
          B: 0.269999981
          A: 1
        }
      }
      Overrides {
        Name: "material_scale"
        Float: 1.52195406
      }
      Overrides {
        Name: "speed"
        Float: -0.317350686
      }
      Overrides {
        Name: "opacity"
        Float: 0.407805562
      }
      Overrides {
        Name: "opacity distance"
        Float: 245.296677
      }
      Overrides {
        Name: "object displacement amount"
        Float: 0.178815767
      }
      Overrides {
        Name: "wind speed"
        Float: 0.341324657
      }
      Overrides {
        Name: "foam tightness"
        Float: 14.2132607
      }
      Overrides {
        Name: "foam shift"
        Float: 0.258817196
      }
      Overrides {
        Name: "foam shape min"
        Float: 0.784530699
      }
      Overrides {
        Name: "foam shape max"
        Float: 0.0975613296
      }
      Overrides {
        Name: "foam shape"
        Float: 3.64167595
      }
      Overrides {
        Name: "reflection brightness"
        Float: 0.230523139
      }
      Overrides {
        Name: "normal foam brightness"
        Float: 0.540767372
      }
      Overrides {
        Name: "edge normal flattening"
        Float: 0.769757152
      }
      Overrides {
        Name: "normal amount"
        Float: 0.836238086
      }
      Overrides {
        Name: "normal distance"
        Float: 5.99861526
      }
      Overrides {
        Name: "foam color"
        Color {
          R: 0.81
          G: 1
          B: 0.943377495
          A: 1
        }
      }
      Overrides {
        Name: "wind direction"
        Vector {
          X: 1
          Z: 0.2
        }
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
