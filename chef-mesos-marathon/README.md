# mb-mesos-marathon-stack-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mb-mesos-marathon-stack']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### mb-mesos-marathon-stack::default

Include `mb-mesos-marathon-stack` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mb-mesos-marathon-stack::default]"
  ]
}
```

## License and Authors

Author:: Socrata, Inc. (<YOUR_EMAIL>)
