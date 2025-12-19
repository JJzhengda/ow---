local y1 = 2
local y2 = 7
local delay = 1
local time_limit =480

function OnEvent(event, arg)
    if event == "PROFILE_ACTIVATED" then
        EnablePrimaryMouseButtonEvents(true)
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
        local start_time = GetRunningTime()
        while IsMouseButtonPressed(1) do
            local current_time = GetRunningTime()
            local elapsed = current_time - start_time
            local step = elapsed < time_limit and y1 or y2
            MoveMouseRelative(0, step)
            Sleep(delay)
        end
    end
end