# Copyright 2014 Google Inc. All Rights Reserved.

"""This is the describe pod command."""
from googlecloudsdk.preview.lib.container import util as c_util


class Describe(c_util.BaseKubecfgCommand):
  """Describe a pod running in a cluster."""

  @staticmethod
  def Args(parser):
    """Register flags for this command."""
    c_util.BaseKubecfgCommand.Args(parser)
    parser.add_argument('name', help='Name of the pod')

  def Run(self, args):
    """This is what gets called when the user runs this command.

    Args:
      args: an argparse namespace. All the arguments that were provided to this
        command invocation.

    Returns:
      Some value that we want to have printed later.
    """
    cluster_config = super(Describe, self).Run(args)
    return self.CallKubecfg(cluster_config, ['get', 'pods/' + args.name])

