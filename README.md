# Grid-Forming Inverter Control Simulation  
**Developed during Internship at LEMTA Laboratory**

This repository presents a simulation of a three-phase grid-forming inverter (GFM) using a cascaded droop and PI control strategy. The project was completed during a research internship at **LEMTA (Laboratoire d’Énergétique et de Mécanique Théorique et Appliquée)** and demonstrates key competencies in **DC grid dynamics, distributed control, and Simulink-based algorithm development**; directly relevant to energy management systems (EMS) for modern power grids.

## Introduction

As modern power systems integrate more renewable energy sources based on inverter technology, maintaining grid stability without synchronous generators has become a growing challenge. **Grid-forming inverters (GFMIs)** are proposed as a solution, capable of regulating voltage and frequency independently.

This project aims to design and simulate a GFMI with **droop control** and **PI-based current regulation**. The goal is to assess its ability to maintain stable operation and support grid dynamics under standalone conditions.



## Objectives

- To design and implement the inner PI-based current controller in the \( dq \)-frame, and test its performance under step inputs and steady-state conditions.  
- To model a three-phase inverter system with an LCL filter in MATLAB/Simulink and integrate it with the inner controller.  
- To develop a droop-based outer control loop for generating voltage and frequency references.  
- To validate that the generated \( V_{cdqref} \) aligns with the capacitor voltage \( V_{cdq} \), confirming correct operation of the overall control strategy.

## Control Equations Summary

###  1. dq-Frame System Model

$$
L \frac{di_d}{dt} = v_d - v_{cd} - r i_d + L \omega i_q
$$
$$
L \frac{di_q}{dt} = v_q - v_{cq} - r i_q - L \omega i_d
$$
$$
C \frac{dv_{cd}}{dt} = i_d - i_{Ld} + C \omega v_{cq} - \frac{v_{cd}}{R_c}
$$
$$
C \frac{dv_{cq}}{dt} = i_q - i_{Lq} - C \omega v_{cd} - \frac{v_{cq}}{R_c}
$$

---

### 2. Inner PI Controller Relationships

These expressions describe the dynamic behavior that the PI controllers aim to achieve:

$$
i_{dq} = i_{dq}^* + i_{Ldq} - C \omega J V_{cdq}
$$
$$
v_{dq} = v_{dq}^* + V_{cdq} - L \omega J i_{dq}
$$

Where:  
$J$ accounts for the rotating reference frame  
$i_{Ldq}$ is the load current in the dq-frame  
$V_{cdq}$ is the capacitor voltage vector

---

### 3. Droop Control Equations

Filtered power expressions using first-order filters:

$$
P_{filtered} = \frac{\omega_c}{s + \omega_c} P_m \quad , \quad Q_{filtered} = \frac{\omega_c}{s + \omega_c} Q_m
$$

Droop equations for frequency and voltage:

$$
\omega_{ref} = \omega_{rated} - m(P_{filtered} - P_{nom})
$$
$$
V_{ref} = V_{rated} - n(Q_{filtered} - Q_{nom})
$$

Final control references:

$$
\theta = \int \omega_{ref} \, dt \quad , \quad V_{cdqref} = V_{ref} \cdot \sqrt{3}
$$

This framework lays the foundation for future work in DC microgrid EMS, especially in integrating distributed energy resources (DERs), optimizing voltage sharing, and enabling plug-and-play operation of power converters.

## 📂 Repository Structure

