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
            "text": "Normal Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\n\ninterface:\n    in event EV_SYS_01_CONFIG\n    in event EV_SYS_01_ENTER\n    in event EV_SYS_01_NEXT\n    in event EV_SYS_01_ESCAPE\n    in event EV_SYS_02_OPEN\n    in event EV_SYS_02_MANUAL\n    in event EV_SYS_02_DETECTED\n    in event EV_SYS_02_NODETECTED\n    in event EV_SYS_02_OPENED\n    in event EV_SYS_02_CLOSED\n    \n    \n    out event EV_ACT_01_PULSE\n    out event EV_ACT_01_NOPULSE\n    out event EV_ACT_02_BLINK\n    out event EV_ACT_02_NOBLINK\n    out event EV_ACT_03_BLINK\n    out event EV_ACT_03_NOBLINK\n    out event EV_ACT_04_ON\n    out event EV_ACT_04_OFF\n    out event EV_ACT_05_ON\n    out event EV_ACT_05_OFF\n    \ninternal:\n    var tick: integer = 0\n    var delay_close: integer = 0\n    var delay_wait: integer = 0\n    var detected: boolean = false"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -549,
          "y": 533
        },
        "size": {
          "height": 1157,
          "width": 1978
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "z": 303,
        "embeds": [
          "e8b877a0-dd33-4b03-860a-475b33112691",
          "bff28d17-3281-4575-9787-fff79ad142de",
          "b9d56f6f-0b64-45ef-9939-be8e4388fb52",
          "538815ab-5db7-4975-a25d-0d232d997bae",
          "223afcae-9b88-483a-9ce8-052bba38a8cd",
          "f7b836ab-a984-4462-a56b-52e81da8a808",
          "15af230b-6724-4d09-a507-2912911a8c6e",
          "0ea8a932-3b8b-4ffd-8304-1d5cd74eebdd",
          "ac7a3553-4a32-40a9-acea-135f300c7ea7",
          "0185e3cb-ac7b-437a-8c9e-fe8a01179eb9",
          "71145e44-d68e-4294-8370-ef57c40dd05e",
          "629acef4-6f74-4cb8-9c91-591657f6268f",
          "7913008c-205d-4140-a424-26dd2577dcf5",
          "ad439c44-fd53-467d-a1c3-1b89af585df4",
          "5e60159a-132d-49c5-9a60-74087476bd9f",
          "1da191df-019a-4413-8836-1db4d73e0e2e",
          "94666897-7f7e-4289-924d-8830a0eb68ac",
          "0a4df2e7-fb6c-40dc-8688-a4af1194dba7",
          "688c48f5-51d7-4118-ad5a-63445a2158be",
          "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "118787ca-2c72-4c2a-83cd-f16828944d0c"
        ],
        "attrs": {
          "priority": {
            "text": 1
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 635,
          "y": 595.5
        },
        "size": {
          "height": 327,
          "width": 462
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "1da191df-019a-4413-8836-1db4d73e0e2e",
        "z": 304,
        "embeds": [],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "text": "ST_SYS_02_OPENING",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -243,
          "y": 595.5
        },
        "size": {
          "height": 327,
          "width": 419
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
        "z": 305,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "text": "ST_SYS_02_CLOSED",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -325,
          "y": 544.5
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
        "id": "0a4df2e7-fb6c-40dc-8688-a4af1194dba7",
        "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
        "z": 307,
        "embeds": [
          "13f0cf51-f191-4bf4-8229-84f81971099e"
        ],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -243,
          "y": 1099.5
        },
        "size": {
          "height": 357,
          "width": 419
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "688c48f5-51d7-4118-ad5a-63445a2158be",
        "z": 308,
        "embeds": [],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "text": "ST_SYS_02_CLOSING",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 635,
          "y": 1099.5
        },
        "size": {
          "height": 357,
          "width": 462
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
        "z": 309,
        "embeds": [
          "348d8b39-8caa-40ef-b2c9-abab669e770c",
          "aee7c5e1-3bd6-46de-ae91-820949aa8344",
          "c0aed4cb-bac1-4957-88c5-75624eb94757"
        ],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "text": "ST_SYS_02_OPENED",
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
          "x": -325,
          "y": 559.5
        },
        "id": "13f0cf51-f191-4bf4-8229-84f81971099e",
        "z": 322,
        "parent": "0a4df2e7-fb6c-40dc-8688-a4af1194dba7",
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
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a"
        },
        "target": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 380,
              "dy": 336.25,
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
                "text": "[tick == 0 && !detected]\n/raise EV_ACT_03_BLINK"
              }
            },
            "position": {
              "distance": 0.4869281045751634,
              "offset": -29,
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
        "id": "629acef4-6f74-4cb8-9c91-591657f6268f",
        "z": 323,
        "vertices": [],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a"
        },
        "target": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 399,
              "dy": 267.75,
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
                "text": "EV_SYS_02_MANUAL\n/raise EV_ACT_03_BLINK\n"
              }
            },
            "position": {
              "distance": 0.49782135076252726,
              "offset": -30,
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
        "id": "ac7a3553-4a32-40a9-acea-135f300c7ea7",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 21,
              "dy": 46.5,
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
                "text": "EV_SYS_02_DETECTED\n/raise EV_ACT_03_NOBLINK; \ntick = delay_wait;\ndetected = true"
              }
            },
            "position": {
              "distance": 0.5217864923747276,
              "offset": 42,
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
        "id": "0ea8a932-3b8b-4ffd-8304-1d5cd74eebdd",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "0a4df2e7-fb6c-40dc-8688-a4af1194dba7"
        },
        "target": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 83,
              "dy": 13,
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
                "text": "/raise EV_ACT_05_ON"
              }
            },
            "position": {
              "distance": 0.8287045116804265,
              "offset": -72.86531066894531,
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
        "id": "7913008c-205d-4140-a424-26dd2577dcf5",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [
          {
            "x": -160,
            "y": 552
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac"
        },
        "target": {
          "id": "1da191df-019a-4413-8836-1db4d73e0e2e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 71,
              "dy": 198.5,
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
                "text": "EV_SYS_02_MANUAL\n/raise EV_ACT_02_BLINK"
              }
            },
            "position": {
              "distance": 0.5042029120982316,
              "offset": -21,
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
        "id": "0185e3cb-ac7b-437a-8c9e-fe8a01179eb9",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac"
        },
        "target": {
          "id": "1da191df-019a-4413-8836-1db4d73e0e2e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 18,
              "dy": 23,
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
                "text": "EV_SYS_02_OPEN\n/raise EV_ACT_05_OFF; \nraise EV_ACT_02_BLINK; \nraise EV_ACT_04_ON"
              }
            },
            "position": {
              "distance": 0.5125876698878336,
              "offset": -36,
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
        "id": "5e60159a-132d-49c5-9a60-74087476bd9f",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "1da191df-019a-4413-8836-1db4d73e0e2e"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 236,
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
                "text": "EV_SYS_02_OPENED\n/tick = delay_close; \nraise EV_ACT_02_NOBLINK;\nraise EV_ACT_04_ON"
              }
            },
            "position": {
              "distance": 0.5056497175141242,
              "offset": -95,
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
        "id": "71145e44-d68e-4294-8370-ef57c40dd05e",
        "z": 323,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "1da191df-019a-4413-8836-1db4d73e0e2e"
        },
        "target": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 215,
              "dy": 294,
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
                "text": "EV_SYS_02_MANUAL\n/raise EV_ACT_02_NOBLINK"
              }
            },
            "position": {
              "distance": 0.4869281045751634,
              "offset": 20,
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
        "id": "ad439c44-fd53-467d-a1c3-1b89af585df4",
        "z": 323,
        "vertices": [],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 155,
              "dy": 102,
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
                "text": "[tick > 0]\n/tick--"
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
        "id": "c0aed4cb-bac1-4957-88c5-75624eb94757",
        "z": 323,
        "vertices": [
          {
            "x": 972,
            "y": 1517
          },
          {
            "x": 907,
            "y": 1517
          }
        ],
        "parent": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 431,
              "dy": 82.5,
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
                "text": "[tick == 0 && detected]\n/raise EV_ACT_01_PULSE;\ndetected = false; \ntick = delay_close"
              }
            },
            "position": {
              "distance": 0.6956984781867305,
              "offset": 59.78264328764838,
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
        "id": "aee7c5e1-3bd6-46de-ae91-820949aa8344",
        "z": 324,
        "parent": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
        "vertices": [
          {
            "x": 1167,
            "y": 1269
          },
          {
            "x": 1167,
            "y": 1238
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 441,
              "dy": 217.5,
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
                "text": "EV_SYS_02_NODETECTED\n[detected]\n/detected = false;\nraise EV_ACT_01_NOPULSE;\ntick = delay_close"
              }
            },
            "position": {
              "distance": 0.4957349028766339,
              "offset": 109,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "5",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "348d8b39-8caa-40ef-b2c9-abab669e770c",
        "z": 325,
        "parent": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
        "vertices": [
          {
            "x": 1173,
            "y": 1407
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be"
        },
        "target": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 59,
              "dy": 289.5,
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
                "text": "EV_SYS_02_CLOSED\n/raise EV_ACT_03_NOBLINK;\nraise EV_ACT_05_ON;\nraise EV_ACT_04_OFF"
              }
            },
            "position": {
              "distance": 0.5169491525423728,
              "offset": 96,
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
        "id": "15af230b-6724-4d09-a507-2912911a8c6e",
        "z": 326,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 302,
          "y": 966
        },
        "size": {
          "height": 81,
          "width": 144
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "118787ca-2c72-4c2a-83cd-f16828944d0c",
        "z": 327,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {
          "name": {
            "text": "ST_SYS_02_IDLE",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 382,
              "dy": 313.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "118787ca-2c72-4c2a-83cd-f16828944d0c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 25,
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
                "text": "EV_SYS_01_CONFIG"
              }
            },
            "position": {
              "distance": 0.596605371777137,
              "offset": -24,
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
        "id": "f7b836ab-a984-4462-a56b-52e81da8a808",
        "z": 328,
        "vertices": [
          {
            "x": 221,
            "y": 991
          }
        ],
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "118787ca-2c72-4c2a-83cd-f16828944d0c"
        },
        "target": {
          "id": "94666897-7f7e-4289-924d-8830a0eb68ac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 341,
              "dy": 314.5,
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
                "text": "EV_SYS_01_CONFIG"
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
        "id": "223afcae-9b88-483a-9ce8-052bba38a8cd",
        "z": 329,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be"
        },
        "target": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 29,
              "dy": 188.5,
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
                "text": "EV_SYS_02_MANUAL\n/tick = delay_close; raise EV_ACT_03_NOBLINK"
              }
            },
            "position": {
              "distance": 0.5806100217864923,
              "offset": 29,
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
        "id": "538815ab-5db7-4975-a25d-0d232d997bae",
        "z": 330,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "688c48f5-51d7-4118-ad5a-63445a2158be"
        },
        "target": {
          "id": "118787ca-2c72-4c2a-83cd-f16828944d0c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 14,
              "dy": 63,
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
                "text": "EV_SYS_01_CONFIG"
              }
            },
            "position": {
              "distance": 0.458720196677848,
              "offset": 10,
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
        "id": "b9d56f6f-0b64-45ef-9939-be8e4388fb52",
        "z": 331,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [
          {
            "x": -2,
            "y": 1084
          },
          {
            "x": 46,
            "y": 1064
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "dd4afe11-cbba-4748-9ddb-e349e1594d9a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 53,
              "dy": 77.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "118787ca-2c72-4c2a-83cd-f16828944d0c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 119,
              "dy": 61,
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
                "text": "EV_SYS_01_CONFIG"
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
                "text": "6",
                "fill": "#555555"
              },
              "circleBody": {
                "fill": "#F0F0F0",
                "stroke": "#555555"
              }
            }
          }
        ],
        "id": "bff28d17-3281-4575-9787-fff79ad142de",
        "z": 332,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [
          {
            "x": 513,
            "y": 1064
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "1da191df-019a-4413-8836-1db4d73e0e2e"
        },
        "target": {
          "id": "118787ca-2c72-4c2a-83cd-f16828944d0c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 131,
              "dy": 31,
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
                "text": "EV_SYS_01_CONFIG"
              }
            },
            "position": {
              "distance": 0.5886028995255019,
              "offset": 12,
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
        "id": "e8b877a0-dd33-4b03-860a-475b33112691",
        "z": 333,
        "parent": "8f8fa5e9-4cd1-4495-8284-0720ea4f9c97",
        "vertices": [
          {
            "x": 680,
            "y": 997
          }
        ],
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
          "moduleName": "Normal",
          "statemachinePrefix": "normal",
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