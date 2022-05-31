local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

Task.Wait(1)

UI.SetCursorVisible(true)
UI.SetCanCursorInteractWithUI(true)

--To manually trigger a dialogue, you can enter the prefix of "dialogue_" followed by the name of the NPC
--given in the property "name".
Dialogue_System_Events.trigger("dialogue_Tobs")