# wtb-cli

A pure `bash` date time converter that mimics the features of [worldtimebuddy](https://www.worldtimebuddy.com).

## Use
```bash
wget https://gitlab.com/fazlerabbi37/wtb-cli/-/raw/main/wtb-cli.sh
chmod +x wtb-cli.sh
./wtb-cli.sh -h
./wtb-cli.sh -t 1600 -d 2022-12-21 -b Asia/Dhaka Asia/Dhaka UTC CET Europe/Madrid Asia/Kolkata UTC-06
```

TODO:
- [ ] interactive input: `timedatectl list-timezones|grep -i taipei` or tzselct. maybe -s flag?
- [ ] if no time, date and base time zone specificed use system default
- [ ] add preset that will be saved in ~/.config/wtb-cli/presets file
