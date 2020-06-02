# Robosemi Official HP
You can view our HP [here](https://robosemi.github.io/).


![robosemi_logo](figure/logo.png)

## Memo for Editors
This section describes how to preview new pages on Ubuntu.

### Setting up
```bash
sudo apt install ruby-dev
git clone https://github.com/pages-themes/cayman
cd cayman
./script/bootstrap
```
The last command sometimes needs the root permission.
After that, execute the following commands:
```bash
cd ${root of this repo.}
sudo bundle install
```

### Previewing
Execute the following command on the root of this repo.
```bash
bundle exec jekyll serve
```
Then visiting [localhost:4000](http://localhost:4000/) in your browser, you can preview pages locally.

## Aknowledgement
This site is based on the [Cayman](https://github.com/pages-themes/cayman) thema.

Our logo has been created on Online Logo Maker.
Look at the awesome logo I made at [Online Logo Maker](https://onlinelogomaker.com/)
