# Grid-Forming Inverter Control Simulation  
**Developed during Internship at LEMTA Laboratory**

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b-orange)](https://www.mathworks.com/products/matlab.html)


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

## 3. Simulation Procedure

The simulation of the grid-forming inverter system was implemented in MATLAB/Simulink using Simscape. The control architecture consists of an outer droop controller and an inner PI-based current controller, both operating in the synchronous \( dq \)-frame. The simulation steps are outlined below:

1. **System setup**:  
   A three-phase inverter is connected to the grid through an LCL filter and a resistive load. The system is modeled in the synchronous reference frame using Simscape components.

2. **Power calculation**:  
   The inverter output active power \( P \) and reactive power \( Q \) are computed using the inverter-side capacitor voltages \( V_{cdq} \) and inductor currents \( I_{ldq} \).

3. **Droop control**:  
   The measured power values are passed into the droop equations to calculate frequency and voltage deviations. The frequency reference is integrated to obtain the phase angle \( \theta \), used for the rotating frame transformation.

4. **Voltage reference generation**:  
   The droop-generated voltage magnitude \( V_{ref} \) is scaled by \( \sqrt{3} \) to produce the voltage references \( V_{cdref} \) and \( V_{cqref} \), which serve as inputs to the voltage control loop.

5. **Outer voltage PI control**:  
   The voltage references are compared with the measured capacitor voltages \( V_{cd} \) and \( V_{cq} \). The error signals are processed through PI controllers to generate the current references \( i_{dref} \) and \( i_{qref} \).

6. **Inner current PI control**:  
   The current references are compared with the actual measured inverter currents \( i_d \) and \( i_q \), and the resulting errors are fed into PI controllers to compute the control voltages \( v_{dref} \) and \( v_{qref} \).

7. **Decoupling and transformation**:  
   Feed-forward decoupling terms are added to minimize coupling between the d- and q-axes. The resulting control voltages are transformed back into the \( abc \)-frame using the calculated phase angle \( \theta \).

8. **Voltage application**:  
   The three-phase voltages \( v_{abc} \) are applied to the inverter terminals, closing the control loop and driving the inverter operation.




