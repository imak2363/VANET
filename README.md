# 🚗 Routing Protocol Selection for ITS of VANET in High Mobility Areas of Bangladesh

<p align="center">
  <img src="https://img.shields.io/badge/Best_Protocol-OLSR-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Best_PDR-99.33%25-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulator-NS2_%2B_SUMO-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Published-Springer_2020-red?style=for-the-badge" />
</p>

<p align="center">
  <a href="https://doi.org/10.1007/978-981-13-7564-4_11">
    📄 Read the Paper (Springer)
  </a>
  &nbsp;|&nbsp;
  <a href="https://doi.org/10.1007/978-981-13-7564-4_11">
    🔗 DOI: 10.1007/978-981-13-7564-4_11
  </a>
</p>

> **Official implementation** of the paper:  
> **"Routing Protocol Selection for Intelligent Transport System (ITS) of VANET in High Mobility Areas of Bangladesh"**  
> *Published as **Chapter 11** in: Proceedings of the International Joint Conference on Computational Intelligence,  
> **Algorithms for Intelligent Systems** — Springer Nature Singapore (2020)*  
> *Editors: M. S. Uddin and J. C. Bansal*

---

## 👥 Authors

**Md. Kamrul Hasan and Orvila Sarker**

Department of Information and Communication Technology,  
Comilla University, Cumilla 3506, Bangladesh

📧 Md. Kamrul Hasan: `kamrul2363@gmail.com`  
📧 Orvila Sarker: `orvila.sarker@gmail.com`

---

## 📌 Overview

Road accidents remain a major public safety challenge in Bangladesh — the Accident Research Institute (ARI) of BUET recorded **789 road accidents between January–March 2018 alone**, resulting in **1,050 deaths and 2,015 injuries**. A key missing piece is an automated **Intelligent Transportation System (ITS)** powered by Vehicular Ad hoc Networks (VANETs).

Before deploying VANET-based ITS in Bangladesh, the right routing protocol must be selected. This study evaluates **four routing protocols** — **AODV, AOMDV, OLSR, and DSDV** — under realistic VANET conditions using a real urban map of Bangladesh (**Paltan area, Dhaka**) extracted from OpenStreetMap.

**Five performance metrics** are analysed across three network load scenarios (50, 100, 150 mobile nodes):
- Packet Delivery Ratio (PDR)
- End-to-End Delay (EED)
- Jitter
- Throughput
- Routing Overhead Ratio (ROR)

**Conclusion: OLSR is the best-fitted protocol** for ITS of VANET in Bangladesh urban environments, offering the best overall balance across all five metrics.

---

## 🏆 Key Results

### Packet Delivery Ratio (PDR)

| Protocol | 50 Nodes | 100 Nodes | 150 Nodes |
|----------|----------|-----------|-----------|
| AODV     | 0.9346   | 0.9898    | 0.9816    |
| AOMDV    | 0.9121   | 0.9933    | 0.9917    |
| **OLSR** | **0.9917**| **0.992** | **0.9920**|
| DSDV     | 0.9725   | 0.9889    | 0.9873    |

### Average End-to-End Delay (ms)

| Protocol | 50 Nodes | 100 Nodes | 150 Nodes |
|----------|----------|-----------|-----------|
| AODV     | 276.94   | 230.40    | 126.84    |
| AOMDV    | 284.05   | 194.00    | 105.88    |
| OLSR     | 292.07   | 130.78    | 175.06    |
| **DSDV** | **230.4**| **101.12**| **149.58**|

> OLSR also achieves low delay (105.88 ms at 50 nodes), very close to DSDV across all scenarios.

### Throughput (kbps)

| Protocol  | 50 Nodes | 100 Nodes | 150 Nodes |
|-----------|----------|-----------|-----------|
| AODV      | 78.12    | 134.76    | **370.77**|
| AOMDV     | 47.98    | 202.83    | 350.80    |
| **OLSR**  | **175.66**| 196.63  | 229.25    |
| DSDV      | 150.88   | 182.27    | 182.06    |

### Routing Overhead Ratio (ROR)

| Protocol  | 50 Nodes | 100 Nodes | 150 Nodes |
|-----------|----------|-----------|-----------|
| AODV      | 2.618    | 3.665     | **0.200** |
| AOMDV     | 2.276    | 2.244     | 2.867     |
| **OLSR**  | **0.200**| **1.661** | **0.736** |
| DSDV      | 16.486   | 2.443     | 3.008     |

---

## 📊 Protocol Recommendation Summary

| Metric          | Best Protocol (Overall) | Notes                                              |
|-----------------|-------------------------|----------------------------------------------------|
| PDR             | **OLSR**                | Highest PDR across all network sizes               |
| End-to-End Delay| **DSDV** / OLSR         | DSDV lowest overall; OLSR very close               |
| Jitter          | **DSDV** / OLSR         | OLSR has lower jitter than AODV/AOMDV              |
| Throughput (low load) | **OLSR**          | 175.66 kbps at 50 nodes                            |
| Throughput (high load)| **AODV**          | 370.77 kbps at 150 nodes                           |
| Routing Overhead| **OLSR**                | Lowest ROR across 50 and 100 node scenarios        |
| **Overall**     | ✅ **OLSR**             | Best combined performance for ITS VANET in Bangladesh |

---

## 🛠️ Simulation Setup

### Tools & Software

| Tool            | Purpose                                                               |
|-----------------|-----------------------------------------------------------------------|
| **NS2**         | Network simulation — runs TCL scripts, generates NAM + trace files   |
| **SUMO**        | Microscopic traffic simulation — vehicle mobility patterns            |
| **TraNS**       | GUI integrating SUMO + NS2 for realistic VANET simulation             |
| **OpenStreetMap**| Real urban map extraction (Paltan area, Dhaka, Bangladesh)          |
| **JOSM**        | Java OpenStreetMap editor — map editing/simplification                |
| **Perl / AWK**  | Trace file analysis and metric extraction                             |
| **Ubuntu Linux**| Host OS for simulation (`netconvert` command for OSM → SUMO network) |

### Simulation Parameters

| Parameter               | Value                          |
|-------------------------|--------------------------------|
| Simulation Area         | 1000 × 1000 m²                 |
| Map Source              | OpenStreetMap (Paltan area, Dhaka) |
| Simulation Duration     | 150 seconds                    |
| Node Speed              | 10 m/s (constant)              |
| Node Scenarios          | 50, 100, 150 mobile nodes      |
| Communication Model     | MAC 802.11g                    |
| Connection Type         | CBR, TCP                       |
| Signal Propagation Model| Two Ray Ground Reflection      |
| Mobility Model          | Random Waypoint                |
| Antenna Model           | Omnidirectional                |
| Interface Queue Type    | Drop Tail / Priority Queue     |
| Interface Queue Length  | 50 packets                     |
| Layer Type              | Link Layer                     |
| Protocols Evaluated     | AODV, AOMDV, OLSR, DSDV        |

---

## 🔄 Simulation Pipeline

```
OpenStreetMap (www.openstreetmap.org)
        │
        │ Download map of Paltan area, Dhaka
        │ (JOSM editor for path simplification)
        ▼
OSM File  ──── netconvert ────►  SUMO Network File (.net.xml)
                                         │
                        Create Route File (.rou.xml)
                        (vehicle nodes: 50 / 100 / 150)
                                         │
                        SUMO Config File (.sumo.cfg)
                                         │
                  traceExporter.py (Python script)
                                         │
                        Mobility TCL File
                                         │
                           TraNS (GUI)
                    (merge mobility + wireless TCL)
                                         │
              NS2 Simulation  ← Routing protocols:
              (AODV, AOMDV,      AODV, AOMDV, OLSR, DSDV
               OLSR, DSDV)
                                         │
                    NS2 Output Files:
                    ├── NAM file (graphical visualization)
                    └── Trace file (.tr)
                                         │
              Perl / AWK Scripts → Analyze:
              PDR | EED | Jitter | Throughput | ROR
```

---

## 📐 Performance Metric Formulas

```
PDR  =  Total Packets Received / Total Packets Sent

Throughput (bits/s)  =  (No. of delivered packets × Packet size × 8)
                         / Total Simulation Period

EED  =  Processing Delay + Queuing Time + Transmission Time + Propagation Time

ROR  =  Routing Packets / Data Packets
```

---

## 📁 Repository Structure

```
VANET-Routing-Protocol-ITS-Bangladesh/
│
├── maps/
│   ├── paltan_area.osm              # Downloaded OSM map of Paltan area, Dhaka
│   ├── paltan_area.net.xml          # SUMO network file (after netconvert)
│   └── paltan_area.sumo.cfg         # SUMO configuration file
│
├── routes/
│   ├── route_50nodes.rou.xml        # Route file: 50 mobile nodes
│   ├── route_100nodes.rou.xml       # Route file: 100 mobile nodes
│   └── route_150nodes.rou.xml       # Route file: 150 mobile nodes
│
├── mobility/
│   ├── mobility_50.tcl              # Mobility TCL for 50 nodes
│   ├── mobility_100.tcl             # Mobility TCL for 100 nodes
│   └── mobility_150.tcl             # Mobility TCL for 150 nodes
│
├── ns2_scripts/
│   ├── aodv_50.tcl                  # NS2 TCL for AODV, 50 nodes
│   ├── aodv_100.tcl
│   ├── aodv_150.tcl
│   ├── aomdv_50.tcl
│   ├── aomdv_100.tcl
│   ├── aomdv_150.tcl
│   ├── olsr_50.tcl
│   ├── olsr_100.tcl
│   ├── olsr_150.tcl
│   ├── dsdv_50.tcl
│   ├── dsdv_100.tcl
│   └── dsdv_150.tcl
│
├── trace_files/
│   ├── aodv_50.tr  |  aodv_100.tr  |  aodv_150.tr
│   ├── aomdv_50.tr |  aomdv_100.tr |  aomdv_150.tr
│   ├── olsr_50.tr  |  olsr_100.tr  |  olsr_150.tr
│   └── dsdv_50.tr  |  dsdv_100.tr  |  dsdv_150.tr
│
├── analysis/
│   ├── pdr.awk                      # AWK script: Packet Delivery Ratio
│   ├── delay.awk                    # AWK script: End-to-End Delay
│   ├── throughput.awk               # AWK script: Throughput
│   ├── jitter.pl                    # Perl script: Jitter analysis
│   └── routing_overhead.awk         # AWK script: Routing Overhead Ratio
│
├── results/
│   ├── pdr_comparison.png
│   ├── delay_comparison.png
│   ├── throughput_comparison.png
│   ├── jitter_aodv.png
│   ├── jitter_aomdv.png
│   ├── jitter_olsr.png
│   ├── jitter_dsdv.png
│   └── routing_overhead_comparison.png
│
└── README.md
```

---

## ⚙️ Usage

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/VANET-Routing-Protocol-ITS-Bangladesh.git
cd VANET-Routing-Protocol-ITS-Bangladesh
```

### 2. Download the Map

Export the Paltan area map (Dhaka, Bangladesh) from [OpenStreetMap](https://www.openstreetmap.org) and save as `maps/paltan_area.osm`. Use JOSM editor to simplify paths if needed.

### 3. Convert OSM to SUMO Network

```bash
netconvert --osm-files maps/paltan_area.osm -o maps/paltan_area.net.xml
```

### 4. Generate Vehicle Mobility

```bash
# Run SUMO with the configuration file
sumo -c maps/paltan_area.sumo.cfg

# Export mobility as TCL (for NS2)
python traceExporter.py --fcd-input <fcd_output.xml> --ns2mobility-output mobility/mobility_50.tcl
```

### 5. Run NS2 Simulation

```bash
# Example: OLSR with 100 nodes
ns ns2_scripts/olsr_100.tcl
```

### 6. Analyse Trace Files

```bash
# PDR analysis
awk -f analysis/pdr.awk trace_files/olsr_100.tr

# Delay analysis
awk -f analysis/delay.awk trace_files/olsr_100.tr

# Throughput analysis
awk -f analysis/throughput.awk trace_files/olsr_100.tr

# Routing overhead
awk -f analysis/routing_overhead.awk trace_files/olsr_100.tr
```

---

## 🆚 Routing Protocol Overview

| Protocol | Type       | Route Discovery | Best Suited For                              |
|----------|------------|-----------------|----------------------------------------------|
| **AODV** | Reactive   | On-demand       | High load / high mobility; best throughput   |
| **AOMDV**| Reactive   | On-demand (multipath) | High load with redundancy               |
| **OLSR** | Proactive  | Table-driven    | **Overall best for ITS VANET in Bangladesh** |
| **DSDV** | Proactive  | Table-driven    | Low delay / low jitter environments          |

---

## 📖 Citation

If you find this work useful, please cite:

```bibtex
@incollection{hasan2020vanet,
  title     = {Routing Protocol Selection for Intelligent Transport System ({ITS})
               of {VANET} in High Mobility Areas of Bangladesh},
  author    = {Hasan, Md. Kamrul and Sarker, Orvila},
  booktitle = {Proceedings of International Joint Conference on Computational Intelligence},
  series    = {Algorithms for Intelligent Systems},
  chapter   = {11},
  pages     = {123--135},
  year      = {2020},
  publisher = {Springer Nature Singapore},
  editors   = {Uddin, M. S. and Bansal, J. C.},
  doi       = {10.1007/978-981-13-7564-4_11}
}
```

---

## 🔮 Future Work

As outlined in the paper:
- Implement and evaluate **hybrid routing protocols** (e.g., TORA, ZRP) in the same simulation setup
- Develop a **novel hybrid protocol** combining the strengths of OLSR and DSDV
- Deploy simulation on **larger urban areas** of Bangladesh
- Incorporate **realistic MAC protocols** and advanced **fading propagation models**
- Extend evaluation to **V2I (Vehicle-to-Infrastructure)** communication scenarios

---

## 📜 License

© 2020 Springer Nature Singapore Pte Ltd. This work is part of the *Algorithms for Intelligent Systems* book series. Please cite the paper if you use this code or methodology in your research.

---

<p align="center">Made with ❤️ toward safer roads and smarter transportation in Bangladesh</p>
