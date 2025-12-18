local y1 = 4
local y2 = 7
local delay = 1
local time_limit = 800
local macro_enabled = false

function OnEvent(event, arg)
    if event == "PROFILE_ACTIVATED" then
        EnablePrimaryMouseButtonEvents(true)
    end

    if event == "G_PRESSED" and arg == 59 then
        macro_enabled = not macro_enabled
        Sleep(100)
    end

    if macro_enabled and event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
        local start_time = GetRunningTime()
        while IsMouseButtonPressed(1) and macro_enabled do
            local current_time = GetRunningTime()
            local elapsed = current_time - start_time
            local step = elapsed < time_limit and y1 or y2
            MoveMouseRelative(0, step)
            Sleep(delay)
        end
    end
end