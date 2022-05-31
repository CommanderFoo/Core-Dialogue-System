Name: "Root"
RootId: 4781671109827199097
Objects {
  Id: 4781671109827199097
  Name: "Root"
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
  ChildIds: 2848436028829331738
  ChildIds: 9273565260654413695
  ChildIds: 6453674706853404538
  ChildIds: 10012879494718726679
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:forceon"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Folder {
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 10012879494718726679
  Name: "Dialogue System - Basic Example"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  TemplateInstance {
    ParameterOverrideMap {
      key: 286628357780536448
      value {
        Overrides {
          Name: "Name"
          String: "Manual_Trigger_Example_Client"
        }
      }
    }
    ParameterOverrideMap {
      key: 8558929229171950540
      value {
        Overrides {
          Name: "Name"
          String: "Dialogue System - Basic Example"
        }
      }
    }
    TemplateAsset {
      Id: 14253404521150788822
    }
  }
}
Objects {
  Id: 6453674706853404538
  Name: "Dialogue System - Advanced Example"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  TemplateInstance {
    ParameterOverrideMap {
      key: 17081892972689086649
      value {
        Overrides {
          Name: "Name"
          String: "Dialogue System - Advanced Example"
        }
      }
    }
    TemplateAsset {
      Id: 6755024686228237351
    }
  }
}
Objects {
  Id: 9273565260654413695
  Name: "Dialogue System"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4781671109827199097
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 4184247561182906195
      value {
        Overrides {
          Name: "Name"
          String: "Dialogue System"
        }
        Overrides {
          Name: "cs:database"
          ObjectReference {
            SelfId: 9015322635920127160
            SubObjectId: 10445891898565376587
            InstanceId: 6453674706853404538
            TemplateId: 6755024686228237351
          }
        }
      }
    }
    TemplateAsset {
      Id: 15369881348772310348
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 2848436028829331738
  Name: "Misc"
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
  ParentId: 4781671109827199097
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
    FilePartitionName: "Misc"
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
