# fluentd-multi

Based on `fluentd-kubernetes-daemonset` but with multiple plugins.

## usage

On new releases by upstream update the submodule and then check for differences
between plugins with `./checkdiff.bash`.

Symlink common files into place with `dosymlink.bash`.

Build a common gemfile that includes all plugins with `buildgemfile.bash` and
then bundle to update the Gemfile.log.

Then, manually combine the `conf/fluent.conf` files as desired.

Finally, run the `./publish.bash` to push the image to docker hub.
