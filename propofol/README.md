# Script to get the laptop lid close suspend function working

## Setup

### To setup appropriate privileges for suspend

```
sudo your-favorite-editor /etc/polkit-1/rules.d/50-suspend.rules
```
And paste the following
```
polkit.addRule(function(action, subject){
    if(action.id == "org.freedesktop.login1.suspend" && subject.user == "YOUR_USERNAME"){
        return polkit.Result.YES;
    }
});
```

### To execute on startup

