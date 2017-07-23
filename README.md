### AdiumMatrix

Built with Adium 1.5.10.4 (7/22/17, hg commit 87b332204cf7)

Wraps https://github.com/matrix-org/purple-matrix as an Adium plugin

Working:
* Connects to matrix.org (haven't tested custom HS yet)
* Oopens all chats on connect, with some history
* Initializes other users and self display names correctly
* Can send and receive chats

Failing:

* Does not populate the buddy list with chats
* Does not set the chat room name or topic
* Does not pull people's avatars (they all show up as the matrix logo)
* Appears that the display name is being used a unique ID in a bad way. E.g. two people with the same nick collide. If you have the same name as another, and one of you changes nick, both appear to change. Search `get_real_name_for_account_conv_buddy` in the adium codebase to debug this. Might want to hash the full (localpart + domain) for the UID.

## Install

A built version is included in the repository. You can simply run `make install` to install it into your Adium directory.

### Building

You will need Xcode.

All dependencies are bundled for convenience.

```
make
make install
```

The `make` task gets [purple-matrix](https://github.com/matrix-org/purple-matrix) and compiles it into an adium wrapper using Xcode.

The `make install` task installs it into the Adium plugins directory.

## Development Resources

If you want to help improve it you'll probably need to get Adium. You can find the [source code on bitbucket](https://bitbucket.org/adium/adium) and clone it using mercurial (`hg`). **Make sure you are using the [adium-1.5.10.4](https://bitbucket.org/adium/adium/branch/adium-1.5.10.4) branch**

The documentation on Adium plugins is basically missing these days, but there are loads of examples of Adium ports (mainly by tripplet on Github).

A helpful tip is to [search for one of the wrapper classes on github](https://github.com/search?p=2&q=CBPurpleAccount&type=Code&utf8=%E2%9C%93)

Some good examples:

https://github.com/majn/telegram-purple

https://github.com/tripplet/Adium-Steam-IM

https://github.com/tripplet/adium-mattermost

https://github.com/tripplet/skypeweb4adium
