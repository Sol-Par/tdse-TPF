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
            "text": "Actuator Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n\n    in event EV_ACT_01_ON\n    in event EV_ACT_01_OFF\n    in event EV_ACT_01_BLINK\n    in event EV_ACT_01_NOBLINK\n\ninternal:\n    var tick: integer \n    const DEL_ACT_01_BLINK:integer = 1\n    const DEL_ACT_01_PULSE:integer = 1\n    \n"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 1623,
          "y": 438
        },
        "size": {
          "height": 1075,
          "width": 1230
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "z": 2791,
        "embeds": [
          "08da0278-9148-4aec-8762-239d18e4f669",
          "48e907f6-5176-4c11-9032-a03d4d2fe47a",
          "1b8b1b44-ba09-4643-88e1-abc1fd71c78c",
          "9843a4c5-ef8a-4e88-893e-3e4fb8384d95",
          "91620ca6-0ee1-4811-996c-33730b4a88ca",
          "6787b313-efc9-4ad6-93bd-dca7445f241a",
          "bb9dd4b0-574d-446a-a45a-6f6d8f90db12",
          "09bdabe8-1f33-4df0-8b52-c9e6cf680a2d",
          "5cf36e36-1cc3-40fa-bc17-13e46b20beb7"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "ACTUATOR\n"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1728,
          "y": 500.5
        },
        "size": {
          "height": 60,
          "width": 243.84375
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "6787b313-efc9-4ad6-93bd-dca7445f241a",
        "z": 2792,
        "embeds": [],
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {
          "name": {
            "text": "ST_ACT_01_ON",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1728,
          "y": 648
        },
        "size": {
          "height": 60.390625,
          "width": 243.84375
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12",
        "z": 2793,
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {
          "name": {
            "text": "ST_ACT_01_OFF",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 1713,
          "y": 730.75
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "09bdabe8-1f33-4df0-8b52-c9e6cf680a2d",
        "z": 2794,
        "embeds": [
          "2ddbff41-5296-4397-a072-bce17c0333f2",
          "c08cbee7-9659-4335-bec2-2f8bf59df210"
        ],
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
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
          "x": 2225,
          "y": 500.5
        },
        "size": {
          "height": 515.78125,
          "width": 449
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "5cf36e36-1cc3-40fa-bc17-13e46b20beb7",
        "z": 2795,
        "embeds": [
          "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727"
        ],
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {
          "name": {
            "text": "ST_ACT_01_BLINKING",
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
          "x": 1713,
          "y": 745.75
        },
        "id": "2ddbff41-5296-4397-a072-bce17c0333f2",
        "z": 2801,
        "parent": "09bdabe8-1f33-4df0-8b52-c9e6cf680a2d",
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
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 1713,
          "y": 745.75
        },
        "id": "c08cbee7-9659-4335-bec2-2f8bf59df210",
        "z": 2802,
        "parent": "09bdabe8-1f33-4df0-8b52-c9e6cf680a2d",
        "attrs": {
          "label": {
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
          "id": "09bdabe8-1f33-4df0-8b52-c9e6cf680a2d"
        },
        "target": {
          "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 123,
              "dy": 3,
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
        "id": "9843a4c5-ef8a-4e88-893e-3e4fb8384d95",
        "z": 2813,
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5cf36e36-1cc3-40fa-bc17-13e46b20beb7"
        },
        "target": {
          "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 209.15625,
              "dy": 48,
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
                "text": "EV_ACT_01_NOBLINK",
                "fill": "#555555"
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
                "text": "1",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "48e907f6-5176-4c11-9032-a03d4d2fe47a",
        "z": 2813,
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12"
        },
        "target": {
          "x": 3855,
          "y": 724,
          "id": "5cf36e36-1cc3-40fa-bc17-13e46b20beb7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 13,
              "dy": 149.90625,
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
                "text": "EV_ACT_01_BLINK\n/tick=DEL_ACT_01_BLINK",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.5513525284539794,
              "offset": -20.000026855468718,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "08da0278-9148-4aec-8762-239d18e4f669",
        "z": 2813,
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12"
        },
        "target": {
          "id": "6787b313-efc9-4ad6-93bd-dca7445f241a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 27,
              "dy": 38.5,
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
                "text": "EV_ACT_01_ON\n"
              }
            },
            "position": {
              "distance": 0.3742857142857143,
              "offset": -54.999912109375146,
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
        "id": "91620ca6-0ee1-4811-996c-33730b4a88ca",
        "z": 2813,
        "vertices": [],
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6787b313-efc9-4ad6-93bd-dca7445f241a"
        },
        "target": {
          "id": "bb9dd4b0-574d-446a-a45a-6f6d8f90db12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 217.15625,
              "dy": 11,
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
                "text": "EV_ACT_01_OFF",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.5228571428571429,
              "offset": 47,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "1b8b1b44-ba09-4643-88e1-abc1fd71c78c",
        "z": 2813,
        "vertices": [],
        "parent": "cc496791-f7f5-4b31-bafa-8bdc12e5b734",
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 2226,
          "y": 522.296875
        },
        "size": {
          "height": 492.984375,
          "width": 447
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "z": 2823,
        "embeds": [
          "824edfff-4c4c-491e-8363-af941b4d44cb",
          "915ec452-724d-4132-93b4-317ce01b9d69",
          "1093b284-ea68-4c1b-ab72-7f9f2b775592",
          "db955fbb-97db-431a-b02b-97dc777f1ba5",
          "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
          "bea55b27-2197-47e0-9a52-666e05bb98ab"
        ],
        "parent": "5cf36e36-1cc3-40fa-bc17-13e46b20beb7",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 2406,
          "y": 588.703125
        },
        "size": {
          "height": 127.1875,
          "width": 71.015625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "db955fbb-97db-431a-b02b-97dc777f1ba5",
        "z": 2824,
        "embeds": [
          "ac448269-0744-490a-a7d4-15d2c79c7421"
        ],
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "attrs": {
          "name": {
            "text": "ON",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 2406,
          "y": 764.2781248092651
        },
        "size": {
          "height": 127.1875,
          "width": 71.015625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
        "z": 2825,
        "embeds": [
          "15c46777-9c55-4363-8b44-5becdbd2ca7a"
        ],
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "attrs": {
          "name": {
            "text": "OFF",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 2238,
          "y": 781.953125
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "bea55b27-2197-47e0-9a52-666e05bb98ab",
        "z": 2826,
        "embeds": [
          "3ef71531-0617-4ada-b3be-c8076cd182a2"
        ],
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
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
          "x": 2238,
          "y": 796.953125
        },
        "id": "3ef71531-0617-4ada-b3be-c8076cd182a2",
        "z": 2832,
        "parent": "bea55b27-2197-47e0-9a52-666e05bb98ab",
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
          "id": "bea55b27-2197-47e0-9a52-666e05bb98ab"
        },
        "target": {
          "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 8,
              "dy": 29.17498779296875,
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
                "fill": "#555555"
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
                "text": "1",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "824edfff-4c4c-491e-8363-af941b4d44cb",
        "z": 2833,
        "vertices": [],
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 60,
              "dy": 94.92498779296875,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 68,
              "dy": 31.17498779296875,
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
                "text": "\n[tick>0]\n/tick --",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.5740465278843505,
              "offset": 58.80615234375,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "15c46777-9c55-4363-8b44-5becdbd2ca7a",
        "z": 2833,
        "parent": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
        "vertices": [
          {
            "x": 2499,
            "y": 830
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439"
        },
        "target": {
          "id": "db955fbb-97db-431a-b02b-97dc777f1ba5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 13,
              "dy": 60.75,
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
                "text": "[tick == 0]\n/tick = DEL_ACT_01_BLINK",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.5631713741055742,
              "offset": -64,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "915ec452-724d-4132-93b4-317ce01b9d69",
        "z": 2833,
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db955fbb-97db-431a-b02b-97dc777f1ba5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 68,
              "dy": 101.296875,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "db955fbb-97db-431a-b02b-97dc777f1ba5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 65,
              "dy": 20.296875,
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
                "text": "\n[tick>0]\n/tick --",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.6259133547380265,
              "offset": 50.721923828125,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "ac448269-0744-490a-a7d4-15d2c79c7421",
        "z": 2833,
        "parent": "db955fbb-97db-431a-b02b-97dc777f1ba5",
        "vertices": [
          {
            "x": 2497,
            "y": 652
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db955fbb-97db-431a-b02b-97dc777f1ba5"
        },
        "target": {
          "id": "9e8343ab-85ed-4f7e-bfdf-3b2cefd00439",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 58,
              "dy": 18.17498779296875,
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
                "text": "[tick == 0]\n/tick = DEL_ACT_01_BLINK",
                "fill": "#555555"
              }
            },
            "position": {
              "distance": 0.4480877143739725,
              "offset": -103.99999999999999,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "1093b284-ea68-4c1b-ab72-7f9f2b775592",
        "z": 2833,
        "parent": "aec7b1c9-a9b9-4cf4-a0d8-ddf04882e727",
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
          "moduleName": "Actuator",
          "statemachinePrefix": "actuator",
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