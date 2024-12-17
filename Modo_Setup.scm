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
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "Modo_Setup Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event EV_SYS_01_CONFIG\n    in event EV_SYS_01_SELECT\n    \ninternal:\n    var index: integer = 0\n    var select : integer = 0\n    var submenu: integer = 0\n    var DEL_SYS_02_STAY_TIME: integer = 0\n    var DEL_SYS_02_WAIT_TIME: integer = 0"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -507,
          "y": -366
        },
        "size": {
          "height": 915,
          "width": 2319
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "z": 197,
        "id": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "embeds": [
          "4cbc7bc4-3c61-4a83-8949-228e11822bf7",
          "39c6c80c-dfe3-4922-8502-298d6836c21c",
          "b2020dce-8a52-40bc-bde5-d6a04c2e3826",
          "ec0ab492-5b51-45ef-ae0b-bedb6fd696f9",
          "4e8dd710-c66e-4af0-b53c-5474263ee90a",
          "d22864df-75d2-414a-8c1c-60081b70a052",
          "4038e557-b703-433c-bc95-7982205f6c88",
          "8b8da1cd-558a-4a57-85d3-206882e2c1ff",
          "25082409-8fa6-42ed-b5c9-8c3bf77b7f17"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "Setup"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 212,
          "y": -188
        },
        "size": {
          "height": 75,
          "width": 136
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 198,
        "id": "d22864df-75d2-414a-8c1c-60081b70a052",
        "embeds": [
          "73ce710d-e72f-4ff7-842b-298f56db3aab",
          "9ea29dbc-4d2e-45d2-b28f-cd7233ec0aed"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYS_01_MENU",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -277,
          "y": -188
        },
        "size": {
          "height": 60,
          "width": 129
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 199,
        "id": "4038e557-b703-433c-bc95-7982205f6c88",
        "attrs": {
          "name": {
            "text": "ST_SYS_01_IDLE",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -399,
          "y": -158
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "entryKind": "Initial",
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
        "z": 200,
        "id": "8b8da1cd-558a-4a57-85d3-206882e2c1ff",
        "embeds": [
          "bec732a4-a452-4b9d-a9c3-7d04ac0ef6ea"
        ],
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 624,
          "y": -203
        },
        "size": {
          "height": 686,
          "width": 854
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 204,
        "id": "25082409-8fa6-42ed-b5c9-8c3bf77b7f17",
        "embeds": [
          "f7800f62-7027-4ad2-984a-9a017513ade5"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYS_01_PARAMS",
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
          "x": -399,
          "y": -143
        },
        "parent": "8b8da1cd-558a-4a57-85d3-206882e2c1ff",
        "z": 210,
        "id": "bec732a4-a452-4b9d-a9c3-7d04ac0ef6ea",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 625,
          "y": -181.203125
        },
        "size": {
          "height": 663.203125,
          "width": 852
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "25082409-8fa6-42ed-b5c9-8c3bf77b7f17",
        "z": 211,
        "id": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "embeds": [
          "decc1e93-cd09-4cca-a706-e149a73270c9",
          "d6de2491-27b7-4537-8a23-07bb98600bc4",
          "9e48ec15-611c-4d39-9528-c6df0d7acc3c",
          "a7b2fae7-d562-4bb8-8c9c-0583563e36f9",
          "e30c8f82-a4fb-439d-b416-9b94b5c1e490",
          "4eb27c8d-adca-4efa-93dd-fb2f9d6cf4c6",
          "8547866a-cf6a-493b-8e69-7282b8cda649",
          "bf5b9e03-10b1-4491-aa67-c38539ad5b98",
          "3c2ce6ff-28de-484c-87ff-aebecca33022",
          "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
          "cd59de40-cc2e-4458-8957-f00ffebbab85",
          "33efbcc9-ce5c-4fcf-9318-cede0736dd48"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 700,
          "y": 68.5
        },
        "size": {
          "height": 68,
          "width": 243.84375
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 212,
        "id": "bf5b9e03-10b1-4491-aa67-c38539ad5b98",
        "attrs": {
          "name": {
            "text": "Idle",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry /raise EV_SYS_01_CONFIG"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 644.0000457763672,
          "y": 95
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "entryKind": "Initial",
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
        "z": 213,
        "id": "3c2ce6ff-28de-484c-87ff-aebecca33022",
        "embeds": [
          "99cec4a5-6076-434a-91fe-a886eade1961"
        ],
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 902,
          "y": -116
        },
        "size": {
          "height": 60,
          "width": 114
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 214,
        "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
        "embeds": [
          "663844c1-2e60-466f-93a4-d85d11cd007b",
          "a2f799fa-04f3-4793-9e1a-f8b58e40710b"
        ],
        "attrs": {
          "name": {
            "text": "Tiempo_Espera",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Exit",
        "position": {
          "x": 1134,
          "y": 105.39842224121094
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 215,
        "id": "cd59de40-cc2e-4458-8957-f00ffebbab85",
        "embeds": [
          "caba6537-0ad8-4550-aec2-cb47c8d6174d"
        ],
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 888.5,
          "y": 346
        },
        "size": {
          "height": 60,
          "width": 141
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 220,
        "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
        "embeds": [
          "f737c6f7-d4fa-4f75-8729-014ee367b1ae",
          "ad5e4cad-b3f9-4b23-909f-c3012f51f67a"
        ],
        "attrs": {
          "name": {
            "text": "Tiempo_Permanencia",
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
          "x": 644.0000457763672,
          "y": 110
        },
        "parent": "3c2ce6ff-28de-484c-87ff-aebecca33022",
        "z": 224,
        "id": "99cec4a5-6076-434a-91fe-a886eade1961",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
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
          "x": 1134,
          "y": 120.39842224121094
        },
        "parent": "cd59de40-cc2e-4458-8957-f00ffebbab85",
        "z": 227,
        "id": "caba6537-0ad8-4550-aec2-cb47c8d6174d",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 134.5,
              "dy": 46
            },
            "name": "topLeft"
          },
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
          "priority": true
        },
        "target": {
          "id": "cd59de40-cc2e-4458-8957-f00ffebbab85"
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 0]\n/DEL_SYS_02_STAY_TIME=index"
              }
            },
            "position": {
              "distance": 0.3409646842818711,
              "offset": 29.6943359375,
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "vertices": [
          {
            "x": 1269,
            "y": 424
          },
          {
            "x": 1229,
            "y": 112.9
          }
        ],
        "z": 228,
        "id": "decc1e93-cd09-4cca-a706-e149a73270c9",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48"
        },
        "target": {
          "id": "cd59de40-cc2e-4458-8957-f00ffebbab85"
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 2]"
              }
            },
            "position": {
              "distance": 0.29063004982357443,
              "offset": 15.770263671875,
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 228,
        "id": "9e48ec15-611c-4d39-9528-c6df0d7acc3c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 13,
              "dy": 5
            },
            "name": "topLeft"
          },
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_SELECT\n/select = (select + 1)%3"
              }
            },
            "position": {
              "distance": 0.631119240521886,
              "offset": 19.03074651776447,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "4",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "parent": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
        "vertices": [
          {
            "x": 890,
            "y": -147
          }
        ],
        "z": 228,
        "id": "663844c1-2e60-466f-93a4-d85d11cd007b",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 104,
              "dy": 5
            },
            "name": "topLeft"
          },
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
          "priority": true
        },
        "target": {
          "id": "cd59de40-cc2e-4458-8957-f00ffebbab85"
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 0]\n/DEL_SYS_02_WAIT_TIME = index"
              }
            },
            "position": {
              "distance": 0.25141995479637236,
              "offset": -22.959033966064453,
              "angle": 0
            }
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "vertices": [
          {
            "x": 1248,
            "y": -132
          },
          {
            "x": 1268,
            "y": 35
          }
        ],
        "z": 228,
        "id": "a7b2fae7-d562-4bb8-8c9c-0583563e36f9",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4"
        },
        "target": {
          "id": "cd59de40-cc2e-4458-8957-f00ffebbab85"
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 2]"
              }
            },
            "position": {
              "distance": 0.27096047049606814,
              "offset": -15.281929016113281,
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 228,
        "id": "e30c8f82-a4fb-439d-b416-9b94b5c1e490",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 26,
              "dy": 39
            },
            "name": "topLeft"
          },
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 1]\n/index = (index + 1) % 10"
              }
            },
            "position": {
              "distance": 0.40874711500576594,
              "offset": -25,
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
        "parent": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
        "vertices": [
          {
            "x": 992,
            "y": -13
          }
        ],
        "z": 228,
        "id": "a2f799fa-04f3-4793-9e1a-f8b58e40710b",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "3c2ce6ff-28de-484c-87ff-aebecca33022"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 6,
              "dy": 38.92857360839844
            },
            "name": "topLeft"
          },
          "id": "bf5b9e03-10b1-4491-aa67-c38539ad5b98",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "z": 228,
        "id": "8547866a-cf6a-493b-8e69-7282b8cda649",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "bf5b9e03-10b1-4491-aa67-c38539ad5b98"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 11,
              "dy": 37.428558349609375
            },
            "name": "topLeft"
          },
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[submenu==1]"
              }
            },
            "position": {
              "distance": 0.7560377955427012,
              "offset": -26.107920485131785,
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "vertices": [
          {
            "x": 746,
            "y": 297.43
          }
        ],
        "z": 228,
        "id": "d6de2491-27b7-4537-8a23-07bb98600bc4",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "bf5b9e03-10b1-4491-aa67-c38539ad5b98"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 6,
              "dy": 31.428571701049805
            },
            "name": "topLeft"
          },
          "id": "df1cde1e-dda4-4f09-8e99-779afe3f95a4",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[submenu==0]"
              }
            },
            "position": {
              "distance": 0.6307466616612677,
              "offset": -17.909463729898647,
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
        "parent": "f7800f62-7027-4ad2-984a-9a017513ade5",
        "vertices": [
          {
            "x": 740,
            "y": -84.57
          }
        ],
        "z": 228,
        "id": "4eb27c8d-adca-4efa-93dd-fb2f9d6cf4c6",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "8b8da1cd-558a-4a57-85d3-206882e2c1ff"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 22,
              "dy": 35
            },
            "name": "topLeft"
          },
          "id": "4038e557-b703-433c-bc95-7982205f6c88",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
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
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 228,
        "id": "4e8dd710-c66e-4af0-b53c-5474263ee90a",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "25082409-8fa6-42ed-b5c9-8c3bf77b7f17"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 127,
              "dy": 53
            },
            "name": "topLeft"
          },
          "id": "d22864df-75d2-414a-8c1c-60081b70a052",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "/index = 0; submenu=0; select = 0"
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
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 228,
        "id": "39c6c80c-dfe3-4922-8502-298d6836c21c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "4038e557-b703-433c-bc95-7982205f6c88"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 8,
              "dy": 21
            },
            "name": "topLeft"
          },
          "id": "d22864df-75d2-414a-8c1c-60081b70a052",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n/index = 0; select = 0"
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
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 228,
        "id": "ec0ab492-5b51-45ef-ae0b-bedb6fd696f9",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d22864df-75d2-414a-8c1c-60081b70a052"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 12,
              "dy": 27
            },
            "name": "topLeft"
          },
          "x": 230,
          "y": -60,
          "id": "25082409-8fa6-42ed-b5c9-8c3bf77b7f17",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 0]\n/submenu = index;\nindex= 0;\nselect = 0"
              }
            },
            "position": {
              "distance": 0.5828721419624661,
              "offset": -40,
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
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 228,
        "id": "4cbc7bc4-3c61-4a83-8949-228e11822bf7",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d22864df-75d2-414a-8c1c-60081b70a052"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 35,
              "dy": 5
            },
            "name": "topLeft"
          },
          "id": "d22864df-75d2-414a-8c1c-60081b70a052",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_SELECT\n/select = (select+1)%3"
              }
            },
            "position": {
              "distance": 0.474596924529897,
              "offset": 25,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "4",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "parent": "d22864df-75d2-414a-8c1c-60081b70a052",
        "vertices": [
          {
            "x": 326,
            "y": -231
          }
        ],
        "z": 228,
        "id": "73ce710d-e72f-4ff7-842b-298f56db3aab",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d22864df-75d2-414a-8c1c-60081b70a052"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 113,
              "dy": 48
            },
            "name": "topLeft"
          },
          "id": "4038e557-b703-433c-bc95-7982205f6c88",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select==2]"
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
        "parent": "8c12a0dd-8a9f-4540-900d-390c81e8f867",
        "z": 228,
        "id": "b2020dce-8a52-40bc-bde5-d6a04c2e3826",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 115,
              "dy": 70
            },
            "name": "topLeft"
          },
          "id": "d22864df-75d2-414a-8c1c-60081b70a052",
          "priority": true
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 28,
              "dy": 66
            },
            "name": "topLeft"
          },
          "id": "d22864df-75d2-414a-8c1c-60081b70a052",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 1]\n/index=(index+1)%2"
              }
            },
            "position": {
              "distance": 0.47884701091970966,
              "offset": -26,
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
        "parent": "d22864df-75d2-414a-8c1c-60081b70a052",
        "vertices": [
          {
            "x": 292,
            "y": -70
          }
        ],
        "z": 228,
        "id": "9ea29dbc-4d2e-45d2-b28f-cd7233ec0aed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 23,
              "dy": 5
            },
            "name": "topLeft"
          },
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_CONFIG\n[select == 1]\n/index = (index + 1) % 10"
              }
            },
            "position": {
              "distance": 0.5070158040205964,
              "offset": 32,
              "angle": 0
            }
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
        "parent": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
        "vertices": [
          {
            "x": 1005.5,
            "y": 318
          }
        ],
        "z": 228,
        "id": "ad5e4cad-b3f9-4b23-909f-c3012f51f67a",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 34.5,
              "dy": 51
            },
            "name": "topLeft"
          },
          "id": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
          "priority": true
        },
        "router": {
          "args": {
            "padding": 8
          },
          "name": "orthogonal"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_01_SELECT\n/select = (select + 1) % 3"
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
                "text": "4",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "parent": "33efbcc9-ce5c-4fcf-9318-cede0736dd48",
        "vertices": [
          {
            "x": 991,
            "y": 442
          }
        ],
        "z": 229,
        "id": "f737c6f7-d4fa-4f75-8729-014ee367b1ae",
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
          "moduleName": "ModoSetup",
          "statemachinePrefix": "modoSetup",
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