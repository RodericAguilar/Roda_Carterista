lib.locale()

Config = {}


Config.CoolDown = 15 -- Time in seconds to wait before starting another robbery

Config.StealDuration = 5 -- Time in seconds
Config.NeedCops = {
    enabled = true, -- if true edit the config down.
    required = 1, -- Number of cops needed to start the robbery
    policeJobs = {
       'police',
       'ambulance',   
    }
}


Config.Rewards = {
    money = { -- Will be selected randomly one line
        {account = 'black_money', min = 100, max = 500},
        {account = 'money', min = 100, max = 500},
    },
    items = { -- Will be selected randomly one line
        {item = 'bread', min = 1, max = 5},
        {item = 'water', min = 1, max = 5},
    }
}