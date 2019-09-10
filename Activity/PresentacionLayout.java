package com.example.app_proyect;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

public class PresentacionLayout extends AppCompatActivity {

    private TextView tvSaludo;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.presentacion_layout);

        tvSaludo = (TextView) findViewById(R.id.tvSaludo);
        llenarSaludo();
    }

    private void llenarSaludo() {
        Bundle bundle = getIntent().getExtras();
        tvSaludo.setText("Nombre: " +bundle.getString("nombre")+
                "\nApellido: "+bundle.getString("apellido")+
                "\nID usuario: "+bundle.getString("Id_user")+
                "\nTipo Usuario: "+bundle.getString("Id_type")+
                "\nEmail: "+bundle.getString("email"));
    }
}
