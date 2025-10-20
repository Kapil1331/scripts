# Script to get the laptop lid close suspend function working

## Setup

### To setup appropriate privileges for suspend

```
sudo nvim /etc/polkit-1/rules.d/50-suspend.rules
```
And paste the following
```
polkit.addRule(function(action, subject){
    if(action.id == "org.freedesktop.login1.suspend" && subject.user == "your-username"){
        return polkit.Result.YES;
    }
});
```

### To execute on startup
```
chmod +x /path-to-your-script/propofol.sh
nvim ~/.config/systemd/user/propofol.service
```
And paste the following
```
[Unit]
Description=lid-close service

[Service]
ExecStart=/path-to-your-script/propofol.sh
Restart=always

[Install]
WantedBy=default.target
```
Start & enable the service
```
systemctl --user enable --now propofol.service
```

## D-bus
- An IPC system
- Using this instead of systemctl suspend to overcome the problem of authorization for non-root users
- Uses the Polkit (PolicyKit) auth rules (defined in /etc/polkit-1/rules.d/*) to authorize the request
