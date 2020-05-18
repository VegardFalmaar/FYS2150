import numpy as np

N = 3
colors = ['Fiolett', 'Blågrønn', 'Rød']
angle_right = [[242.4, 242.6],
                [246.6, 246.8],
                [261.8, 262.0]]

angle_left = [[180.6, 180.9],
                [176.4, 176.6],
                [160.0, 160.2]]

s_angle = 0.1
d = 2.54E-2/30E3

def wavelengths(N, colors, angle_right, angle_left):
    for i in range(N):
        print(f'Color: {colors[i]}')
        alpha_r = np.mean(angle_right[i])
        n = len(angle_right[i])
        s_alpha_r = np.sqrt(np.std(angle_right[i])**2/n + 0.1**2)
        alpha_l = np.mean(angle_left[i])
        s_alpha_l = np.sqrt(np.std(angle_left[i])**2/n + 0.1**2)
    
        theta = (alpha_r - alpha_l)/2*np.pi/180 # radians
        s_theta = np.pi/2/180*np.sqrt(s_alpha_r**2 + s_alpha_l**2)
        lmbda = d*np.sin(theta) # m
        s_lmbda = lmbda*abs(s_theta/np.tan(theta))
        print('Wavelength: {:.1f} +- {:.1f} nm\n'.format(lmbda*1E9, s_lmbda*1E9))

print('Hydrogen')
wavelengths(N, colors, angle_right, angle_left)


N = 6
colors = ['Rød', 'Gul', 'Grønn', 'Blågrønn', 'Blå', 'Blåfiolett']
angle_right = [[263.1],
                [255.2],
                [247.8],
                [247.0],
                [245.4],
                [243.5]]

angle_left = [[158.7],
                [167.2],
                [175.0],
                [175.8],
                [177.6],
                [179.6]]
print('Helium')
wavelengths(N, colors, angle_right, angle_left)
