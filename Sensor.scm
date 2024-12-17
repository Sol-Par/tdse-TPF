{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "sensor Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event EV_BTN_01_UP\n    in event EV_BTN_01_DOWN\n\n    out event EV_SYS_01_SWITCH\n    \ninternal:\n    var tick: integer \n    const DEL_BTN_01_MAX:integer = 1\n"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 298.8125,
          "y": 452.5
        },
        "size": {
          "height": 611,
          "width": 941
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "z": 3124,
        "embeds": [
          "c5f57d1c-084e-4561-b70a-a55e124d244e",
          "ef557991-ce5c-49b0-84c1-d23de510fd10",
          "26dc70e8-0c4c-4389-83b7-d8aa956a60dd",
          "3bf1405d-dc7d-4f43-83a7-2befdc0e6bf6",
          "79aed527-3422-4128-be5a-2b0c2f778fe1",
          "19371d0a-742e-4261-92c1-f77b7454e39a",
          "dd9b95ab-1cb7-43db-a9b7-a74274a645ec",
          "3c6b61ac-658b-4355-b555-ab98d102f6d3",
          "5c863085-3ff8-43b3-9063-e17b615aa1d1",
          "a15c62c8-bad6-4a29-a401-0694075df486",
          "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908",
          "4a76776e-f903-47ec-b6dd-1354fb498d59"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "sensor "
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 351.13541412353516,
          "y": 735
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "3c6b61ac-658b-4355-b555-ab98d102f6d3",
        "z": 3125,
        "embeds": [
          "eb7c4739-22b8-408c-addc-1b26d04fac3b"
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 633.8125,
          "y": 595.5
        },
        "size": {
          "height": 60,
          "width": 122.421875
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1",
        "z": 3126,
        "embeds": [
          "0fe3a053-5fd6-4115-869f-4b688f619cab"
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {
          "name": {
            "text": "ST_BTN_01_FALLING",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 430.13541412353516,
          "y": 735
        },
        "size": {
          "height": 60,
          "width": 93.625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "a15c62c8-bad6-4a29-a401-0694075df486",
        "z": 3127,
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {
          "name": {
            "text": "ST_BTN_01_UP",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 621.796875,
          "y": 883.25
        },
        "size": {
          "height": 60,
          "width": 144.03125
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908",
        "z": 3128,
        "embeds": [
          "4e3cba6a-c09c-4da4-b3a0-428c22061fdb"
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {
          "name": {
            "text": "ST_BRN_01_INCREASING",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 933.8125,
          "y": 728
        },
        "size": {
          "height": 67.25,
          "width": 180
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "4a76776e-f903-47ec-b6dd-1354fb498d59",
        "z": 3129,
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {
          "name": {
            "text": "ST_BTN_01_DOWN",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 351.13541412353516,
          "y": 750
        },
        "id": "eb7c4739-22b8-408c-addc-1b26d04fac3b",
        "z": 3138,
        "parent": "3c6b61ac-658b-4355-b555-ab98d102f6d3",
        "attrs": {
          "label": {
            "fill": "#C5C8C6",
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "4a76776e-f903-47ec-b6dd-1354fb498d59"
        },
        "target": {
          "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 144.02084350585938,
              "dy": 37.333343505859375,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_UP\n/tick=DEL_BTN_01_MAX"
              }
            },
            "position": {
              "distance": 0.7553399900313791,
              "offset": 36.04432775984063,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "id": "3bf1405d-dc7d-4f43-83a7-2befdc0e6bf6",
        "z": 3139,
        "vertices": [
          {
            "x": 978.8125,
            "y": 818.5
          },
          {
            "x": 888.8125,
            "y": 920.58
          }
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908"
        },
        "target": {
          "id": "4a76776e-f903-47ec-b6dd-1354fb498d59",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4.01043701171875,
              "dy": 34.33332824707031,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_DOWN\n[tick>0]"
              }
            },
            "position": {
              "distance": 0.6592420580910582,
              "offset": -30.99547397151152,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "id": "26dc70e8-0c4c-4389-83b7-d8aa956a60dd",
        "z": 3139,
        "vertices": [
          {
            "x": 708.81,
            "y": 829
          }
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a15c62c8-bad6-4a29-a401-0694075df486"
        },
        "target": {
          "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7.21527099609375,
              "dy": 43,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_DOWN\n/tick=DEL_BTN_01_MAX\n"
              }
            },
            "position": {
              "distance": 0.645473459670618,
              "offset": -18,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "id": "79aed527-3422-4128-be5a-2b0c2f778fe1",
        "z": 3139,
        "vertices": [
          {
            "x": 494,
            "y": 638.5
          }
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1"
        },
        "target": {
          "id": "4a76776e-f903-47ec-b6dd-1354fb498d59",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 156,
              "dy": 6.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_DOWN\n[tick==0]\n/raise EV_SYS_01_SWITCH"
              }
            },
            "position": {
              "distance": 0.3197793459474453,
              "offset": -28.942901017260674,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          }
        ],
        "id": "ef557991-ce5c-49b0-84c1-d23de510fd10",
        "z": 3139,
        "vertices": [
          {
            "x": 1029.8125,
            "y": 595.5
          }
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1"
        },
        "target": {
          "id": "a15c62c8-bad6-4a29-a401-0694075df486",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 89.80938720703125,
              "dy": 34,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_UP \n[tick>0]"
              }
            },
            "position": {
              "distance": 0.6386795004416448,
              "offset": -18,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "id": "19371d0a-742e-4261-92c1-f77b7454e39a",
        "z": 3139,
        "vertices": [
          {
            "x": 678.81,
            "y": 769
          }
        ],
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "3c6b61ac-658b-4355-b555-ab98d102f6d3"
        },
        "target": {
          "id": "a15c62c8-bad6-4a29-a401-0694075df486",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 51.677093505859375,
              "dy": 34.25335693359375,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "id": "dd9b95ab-1cb7-43db-a9b7-a74274a645ec",
        "z": 3139,
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1"
        },
        "target": {
          "id": "5c863085-3ff8-43b3-9063-e17b615aa1d1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 30.01354217529297,
              "dy": 7.8333282470703125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_DOWN\n[tick>0]\n/tick--"
              }
            },
            "position": {
              "distance": 0.3749577927607647,
              "offset": 29.530556495205758,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "3"
              }
            }
          }
        ],
        "id": "0fe3a053-5fd6-4115-869f-4b688f619cab",
        "z": 3139,
        "vertices": [
          {
            "x": 695.02,
            "y": 550
          },
          {
            "x": 663.83,
            "y": 578.5
          }
        ],
        "parent": "5c863085-3ff8-43b3-9063-e17b615aa1d1",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908"
        },
        "target": {
          "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 96,
              "dy": 33,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_UP\n[tick>0]\n/tick--"
              }
            },
            "position": {
              "distance": 0.5825293717609478,
              "offset": 31.59063720703125,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          }
        ],
        "id": "4e3cba6a-c09c-4da4-b3a0-428c22061fdb",
        "z": 3140,
        "parent": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908",
        "vertices": [
          {
            "x": 678.81,
            "y": 969
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c1d36a9b-aa00-4117-9ca8-dc3dcfaec908"
        },
        "target": {
          "id": "a15c62c8-bad6-4a29-a401-0694075df486",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 46.864593505859375,
              "dy": 51,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_01_UP\n[tick==0]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "3",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "c5f57d1c-084e-4561-b70a-a55e124d244e",
        "z": 3141,
        "parent": "6b3031e2-ab70-4e1a-8160-b464e4da994e",
        "attrs": {}
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "Sensor",
          "statemachinePrefix": "sensor",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": "",
          "exitState": "",
          "generic": ""
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}