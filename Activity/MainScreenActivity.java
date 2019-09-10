package com.example.app_proyect;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.example.app_proyect.VolleyController.AppController;

import org.json.JSONArray;
import org.json.JSONException;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class MainScreenActivity extends AppCompatActivity {

    private EditText etUsuario;
    private      EditText etPass;
         String urlLogin = "http://192.168.1.2/Proyecto/android_connect/login.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_screen);

        etUsuario = (EditText) findViewById(R.id.etUser);
        etPass = (EditText) findViewById(R.id.etPass);
    }

    public void btnAceptar(View view){
        final String usuario = etUsuario.getText().toString();
        final String pass = etPass.getText().toString();

        //INICIAR LA CONEXION CON VOLLEY
        StringRequest request = new StringRequest(Request.Method.POST, "https://192.168.1.2/Proyecto/android_connect/login.php",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        //Se ejecuta cuando la consulta sale bien
                        if(response.equals("0")){
                            Toast.makeText(MainScreenActivity.this, "Datos Usuario incorrecto", Toast.LENGTH_SHORT).show();
                        }else {

                            try {
                                JSONArray jsonArray = new JSONArray(response);
                                //Tenemos los datos que devuelve el servidor
                                String Id_user = jsonArray.getJSONObject(0).getString("ID_Usuario");
                                String Id_type = jsonArray.getJSONObject(0).getString("ID_Tipo");
                                String nombre = jsonArray.getJSONObject(0).getString("Nombre");
                                String apellido = jsonArray.getJSONObject(0).getString("Apellido");
                                String email = jsonArray.getJSONObject(0).getString("Email");

                                if(Id_type.equals("1")) {
                                    Id_type = "Cliente";
                                }else Id_type = "Dueño";

                                //Abrimos el activity y mandamos los datos que se van a mostrar
                                Intent intent = new Intent(MainScreenActivity.this, PresentacionLayout.class);
                                intent.putExtra("nombre", nombre);
                                intent.putExtra("Id_user", Id_user);
                                intent.putExtra("Id_type", Id_type);
                                intent.putExtra("apellido", apellido);
                                intent.putExtra("email", email);
                                startActivity(intent);

                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        //Se ejecuta cuando hay errores de conexion
                        Toast.makeText(MainScreenActivity.this, "ERROR DE CONEXION JEJE", Toast.LENGTH_SHORT).show();


                    }
                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                //Se evian los datos de forma MAP < Clave, Valor>
                Map<String, String> parametros = new HashMap<>();
                parametros.put("usuario", usuario);
                parametros.put("pass", pass);

                return parametros;
            }
        };

        AppController.getInstance().addToRequestQueue(request);


    }







}
