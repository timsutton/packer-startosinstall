# packer-startosinstall (an experiment)

Idea here is to use packer and startosinstall to perform an automated installation of macOS in a VM. It requires VMware Fusion.

## Usage

Run `prepare_iso` to create a new installer VMDK. This relies a tool that's bundled with VMware Fusion:

```
./prepare_iso /path/to/a/10.15.3/installer/app installer_10.15.3.vmdk
```

Run `create_bootstrap_pkg.sh` to generate a post-install package that we'll eventually pass to the macOS installer:

```
./create_bootstrap_pkg.sh
```


Now we can run packer to build it, passing our installer VMDK as a variable:
```
packer build -var iso_url=installer_10.15.3.vmdk packer.json
```

## Additional options

See the `variables` section of `packer.json` for more configuration options. Notably, there's an option to disable SIP.

## Debugging

You may want to set the `PACKER_LOG=info` or `PACKER_LOG=debug` environment variables if you're hacking on this and debugging connectivity/sequence issues with Packer.

## TODO

* Add back a configuration profile or other means to disable Setup Assistant things, auto-login, and other updated items from [osx-vm-templates](https://github.com/timsutton/osx-vm-templates/), etc.
* Explain more about how this works
* Document why we use a .gotmpl for the VMX configuration, why packer's existing VMX configuration options weren't sufficient.
