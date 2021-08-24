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
  ChildIds: 14372131131939559137
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
}
Objects {
  Id: 14372131131939559137
  Name: "Dialogue System - Basic Example"
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
            SelfId: 1241303364983455122
            SubObjectId: 3580054066914520204
            InstanceId: 14372131131939559137
            TemplateId: 14253404521150788822
          }
        }
      }
    }
    TemplateAsset {
      Id: 15369881348772310348
    }
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
}
