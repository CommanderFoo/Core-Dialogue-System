Name: "System"
RootId: 8738689089831792795
Objects {
  Id: 10751287107692529248
  Name: "Audio"
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
  ParentId: 8738689089831792795
  ChildIds: 8037493938369256524
  ChildIds: 156897786969627631
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
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
  InstanceHistory {
    SelfId: 10751287107692529248
    SubobjectId: 3163492330995449369
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 156897786969627631
  Name: "Type Sound"
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
  ParentId: 10751287107692529248
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
  AudioInstance {
    AudioAsset {
      Id: 17640614121248612054
    }
    Volume: 0.5
    Falloff: -1
    Radius: -1
    StopTime: 0.01
  }
  InstanceHistory {
    SelfId: 156897786969627631
    SubobjectId: 13618793593882370966
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 8037493938369256524
  Name: "Click Sound"
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
  ParentId: 10751287107692529248
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
  AudioInstance {
    AudioAsset {
      Id: 1569886613314956351
    }
    Volume: 0.8
    Falloff: -1
    Radius: -1
  }
  InstanceHistory {
    SelfId: 8037493938369256524
    SubobjectId: 15084858688822649909
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 13113578673152777489
  Name: "Server"
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
  ParentId: 8738689089831792795
  ChildIds: 11329266060537783744
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
    Type: Server
  }
  InstanceHistory {
    SelfId: 13113578673152777489
    SubobjectId: 805598399629829480
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 11329266060537783744
  Name: "Dialogue_Manager_Server"
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
  ParentId: 13113578673152777489
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
      Id: 4772432109021801992
    }
  }
  InstanceHistory {
    SelfId: 11329266060537783744
    SubobjectId: 2588274973270973881
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 13494690462064067990
  Name: "Client"
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
  ParentId: 8738689089831792795
  ChildIds: 4084315448851654513
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
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
  InstanceHistory {
    SelfId: 13494690462064067990
    SubobjectId: 401946613759196655
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 4084315448851654513
  Name: "Dialogue_Manager_Client"
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
  ParentId: 13494690462064067990
  UnregisteredParameters {
    Overrides {
      Name: "cs:root"
      ObjectReference {
        SelfId: 9566678969520881450
      }
    }
    Overrides {
      Name: "cs:ui_container"
      ObjectReference {
        SelfId: 10265474291264224698
      }
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
      Id: 6550432100798697856
    }
  }
  InstanceHistory {
    SelfId: 4084315448851654513
    SubobjectId: 9690799066519609096
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 13098294607338067729
  Name: "UI"
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
  ParentId: 8738689089831792795
  ChildIds: 10265474291264224698
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
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
  InstanceHistory {
    SelfId: 13098294607338067729
    SubobjectId: 798466060464107368
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 10265474291264224698
  Name: "Dialogue UI Container"
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
  ParentId: 13098294607338067729
  ChildIds: 18376294672943418469
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
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    Canvas {
      ContentType {
        Value: "mc:ecanvascontenttype:dynamic"
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
  InstanceHistory {
    SelfId: 10265474291264224698
    SubobjectId: 3505083985360487875
    InstanceId: 18079692430878360874
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 18376294672943418469
  Name: "Dialogue System - Animal Crossing Theme [Dialogue]"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 10265474291264224698
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:forceoff"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 11801476459853782834
      value {
        Overrides {
          Name: "Name"
          String: "Dialogue System - Animal Crossing Theme [Dialogue]"
        }
        Overrides {
          Name: "Position"
          Vector {
          }
        }
        Overrides {
          Name: "Rotation"
          Rotator {
          }
        }
        Overrides {
          Name: "Visible"
          Enum {
            Value: "mc:evisibilitysetting:forceoff"
          }
        }
      }
    }
    TemplateAsset {
      Id: 15941761266032416982
    }
  }
}
