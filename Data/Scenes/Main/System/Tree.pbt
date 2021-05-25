Name: "System"
RootId: 6759831606920655153
Objects {
  Id: 12807549922567505866
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
  ParentId: 6759831606920655153
  ChildIds: 5405263219254959590
  ChildIds: 2784589964642966085
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
    SelfId: 12807549922567505866
    SubobjectId: 3163492330995449369
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 2784589964642966085
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
  ParentId: 12807549922567505866
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
    SelfId: 2784589964642966085
    SubobjectId: 13618793593882370966
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 5405263219254959590
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
  ParentId: 12807549922567505866
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
    SelfId: 5405263219254959590
    SubobjectId: 15084858688822649909
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 10481418081977441467
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
  ParentId: 6759831606920655153
  ChildIds: 13380215454468514922
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
    SelfId: 10481418081977441467
    SubobjectId: 805598399629829480
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 13380215454468514922
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
  ParentId: 10481418081977441467
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
    SelfId: 13380215454468514922
    SubobjectId: 2588274973270973881
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 11515551549503407164
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
  ParentId: 6759831606920655153
  ChildIds: 2028826722518345435
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
    SelfId: 11515551549503407164
    SubobjectId: 401946613759196655
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 2028826722518345435
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
  ParentId: 11515551549503407164
  UnregisteredParameters {
    Overrides {
      Name: "cs:root"
      ObjectReference {
        SelfId: 11550074651695267456
      }
    }
    Overrides {
      Name: "cs:ui_container"
      ObjectReference {
        SelfId: 12321842120188148752
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
    SelfId: 2028826722518345435
    SubobjectId: 9690799066519609096
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 10470814060549707451
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
  ParentId: 6759831606920655153
  ChildIds: 12321842120188148752
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
    SelfId: 10470814060549707451
    SubobjectId: 798466060464107368
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
Objects {
  Id: 12321842120188148752
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
  ParentId: 10470814060549707451
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
    SelfId: 12321842120188148752
    SubobjectId: 3505083985360487875
    InstanceId: 9732342375738209615
    TemplateId: 15369881348772310348
  }
}
