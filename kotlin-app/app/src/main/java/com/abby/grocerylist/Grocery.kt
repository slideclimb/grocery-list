package com.abby.grocerylist

import com.google.firebase.firestore.CollectionReference
import com.google.firebase.firestore.FirebaseFirestore

class Grocery(
    private val id: String,
    val done: Boolean = false,
    val item: String = "",
    private val db: FirebaseFirestore = FirebaseFirestore.getInstance(),
    private val collection: CollectionReference = db.collection("groceries")
) {

    fun update(newDone: Boolean) {
        collection.document(id).update("done", newDone)
    }

    fun delete() {
        collection.document(id).delete()
    }
}