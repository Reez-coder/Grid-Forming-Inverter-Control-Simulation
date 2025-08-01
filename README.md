# Grid-Forming Inverter Control Simulation  
**Developed during Internship at LEMTA Laboratory**

This repository presents a simulation of a three-phase grid-forming inverter (GFM) using a cascaded droop and PI control strategy. The project was completed during a research internship at **LEMTA (Laboratoire d’Énergétique et de Mécanique Théorique et Appliquée)** and demonstrates key competencies in **DC grid dynamics, distributed control, and Simulink-based algorithm development**; directly relevant to energy management systems (EMS) for modern power grids.

## Introduction

As modern power systems integrate more renewable energy sources based on inverter technology, maintaining grid stability without synchronous generators has become a growing challenge. **Grid-forming inverters (GFMIs)** are proposed as a solution, capable of regulating voltage and frequency independently.

This project aims to design and simulate a GFMI with **droop control** and **PI-based current regulation**. The goal is to assess its ability to maintain stable operation and support grid dynamics under standalone conditions.

---

## Objectives

- To design and implement the inner PI-based current controller in the \( dq \)-frame, and test its performance under step inputs and steady-state conditions.  
- To model a three-phase inverter system with an LCL filter in MATLAB/Simulink and integrate it with the inner controller.  
- To develop a droop-based outer control loop for generating voltage and frequency references.  
- To validate that the generated \( V_{cdqref} \) aligns with the capacitor voltage \( V_{cdq} \), confirming correct operation of the overall control strategy.

## 🔧 Tools and Methods

- MATLAB/Simulink with custom function blocks for differential equations  
- Implementation of active and reactive power droop control  
- dq-frame modeling of current and capacitor voltage dynamics  
- Step response and steady-state validation  

This framework lays the foundation for future work in DC microgrid EMS, especially in integrating distributed energy resources (DERs), optimizing voltage sharing, and enabling plug-and-play operation of power converters.

---

## 📂 Repository Structure

